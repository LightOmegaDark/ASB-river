/*
===========================================================================

  Copyright (c) 2021 LandSandBoat Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "logging.h"
#include "settings.h"
#include "tracy.h"
#include "utils.h"

#include "spdlog/common.h"

#include "spdlog/async.h"
#include "spdlog/pattern_formatter.h"
#include "spdlog/sinks/basic_file_sink.h"
#include "spdlog/sinks/daily_file_sink.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace logging
{
    const std::vector<std::string> logNames = {
        "critical",
        "error",
        "lua",
        "warn",
        "info",
        "debug",
        "trace",
    };

    void InitializeLog(std::string const& serverName, std::string const& logFile, bool appendDate)
    {
        ServerName = serverName;

        // If you create more than one worker thread, messages may be delivered out of order
        spdlog::init_thread_pool(8192, 1);
        spdlog::flush_on(spdlog::level::warn);
        spdlog::flush_every(std::chrono::seconds(5));

        // Sink to console
        auto                          stdout_sink = std::make_shared<spdlog::sinks::stdout_color_sink_mt>();
        std::vector<spdlog::sink_ptr> sinks{ stdout_sink };

        // Daily Sink, creating new files at midnight
        if (appendDate)
        {
            sinks.push_back(std::make_shared<spdlog::sinks::daily_file_sink_mt>(logFile, 0, 0, false, 0));
        }
        // Basic sink, sink to file with name specified in main routine
        else
        {
            sinks.push_back(std::make_shared<spdlog::sinks::basic_file_sink_mt>(logFile));
        }

        for (auto& name : logNames)
        {
            auto logger = std::make_shared<spdlog::async_logger>(name, sinks.begin(), sinks.end(), spdlog::thread_pool());
            spdlog::register_logger(logger);
        }

        spdlog::set_level(spdlog::level::debug);

        // direct printf replacement
        auto standardLogger = createLogger("standard");
        auto messageLogger  = createLogger("message");

        // To inform about good things
        auto statusLogger = createLogger("status");

        // Variable information
        auto infoLogger = createLogger("info");

        // Less than a warning
        auto noticeLogger = createLogger("notice");

        // Warnings
        auto warningLogger = createLogger("warning");

        // Important stuff
        auto debugLogger = createLogger("debug");

        // Regular errors
        auto errorLogger = createLogger("error");

        // Fatal errors, abort(); if possible
        auto fatalErrorLogger = createLogger("fatalerror");

        // For dumping out anything related with SQL) <- Actually, this is mostly used for SQL errors with the database, as
        // successes can as well just be anything else...
        auto sqlLogger = createLogger("sql");

        // Lua related logging and errors
        auto luaLogger = createLogger("lua");

        // Navmesh related errors
        auto navmeshLogger = createLogger("navmesh");

        // Mostly useless "player did this" info
        auto actionLogger = createLogger("action");

        // Detected a likely exploit
        auto exploitLogger = createLogger("exploit");

        // Dumping stacktraces
        auto stacktraceLogger = createLogger("stacktrace");

        spdlog::set_default_logger(standardLogger);
        spdlog::flush_on(spdlog::level::warn);
        spdlog::flush_every(std::chrono::seconds(30));

        // Set default log level (everything)
        spdlog::set_level(spdlog::level::trace);
    }

    void ShutDown()
    {
        spdlog::drop_all();
        spdlog::shutdown();
    }

    void SetPattern(std::string const& str)
    {
        TracyZoneScoped;

        // TODO: Loopify this, this sucks
        if (filterMask & MSG_STANDARD)
        {
            spdlog::get("standard")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_STATUS)
        {
            spdlog::get("status")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_INFO)
        {
            spdlog::get("info")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_NOTICE)
        {
            spdlog::get("notice")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_WARNING)
        {
            spdlog::get("warning")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_DEBUG)
        {
            spdlog::get("debug")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_ERROR)
        {
            spdlog::get("error")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_FATALERROR)
        {
            spdlog::get("fatalerror")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_SQL)
        {
            spdlog::get("sql")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_LUASCRIPT)
        {
            spdlog::get("lua")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_NAVMESH)
        {
            spdlog::get("navmesh")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_ACTION)
        {
            spdlog::get("action")->set_level(spdlog::level::off);
        }

        if (filterMask & MSG_EXPLOIT)
        {
            spdlog::get("exploit")->set_level(spdlog::level::off);
        }
    }
} // namespace logging
