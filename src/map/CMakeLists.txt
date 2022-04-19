set(SOURCES
    ability.cpp
    ability.h
    alliance.cpp
    alliance.h
    anticheat.cpp
    anticheat.h
    attack.cpp
    attack.h
    attackround.cpp
    attackround.h
    battlefield_handler.cpp
    battlefield_handler.h
    battlefield.cpp
    battlefield.h
    blue_spell.cpp
    blue_spell.h
    blue_trait.cpp
    blue_trait.h
    campaign_handler.cpp
    campaign_handler.h
    campaign_system.cpp
    campaign_system.h
    char_recast_container.cpp
    char_recast_container.h
    commandhandler.cpp
    commandhandler.h
    conquest_system.cpp
    conquest_system.h
    daily_system.cpp
    daily_system.h
    enmity_container.cpp
    enmity_container.h
    event_info.h
    grades.cpp
    grades.h
    guild.cpp
    guild.h
    instance_loader.cpp
    instance_loader.h
    instance.cpp
    instance.h
    item_container.cpp
    item_container.h
    items.h
    job_points.cpp
    job_points.h
    latent_effect_container.cpp
    latent_effect_container.h
    latent_effect.cpp
    latent_effect.h
    linkshell.cpp
    linkshell.h
    map.cpp
    map.h
    merit.cpp
    merit.h
    message.cpp
    message.h
    mob_modifier.h
    mob_spell_container.cpp
    mob_spell_container.h
    mob_spell_list.cpp
    mob_spell_list.h
    mobskill.cpp
    mobskill.h
    modifier.cpp
    modifier.h
    navmesh.cpp
    navmesh.h
    notoriety_container.cpp
    notoriety_container.h
    packet_guard.cpp
    packet_guard.h
    packet_system.cpp
    packet_system.h
    party.cpp
    party.h
    recast_container.cpp
    recast_container.h
    region.cpp
    region.h
    roe.cpp
    roe.h
    spell.cpp
    spell.h
    status_effect_container.cpp
    status_effect_container.h
    status_effect.cpp
    status_effect.h
    time_server.cpp
    time_server.h
    timetriggers.cpp
    timetriggers.h
    trade_container.cpp
    trade_container.h
    trait.cpp
    trait.h
    transport.cpp
    transport.h
    treasure_pool.cpp
    treasure_pool.h
    unitychat.cpp
    unitychat.h
    universal_container.cpp
    universal_container.h
    vana_time.cpp
    vana_time.h
    weapon_skill.cpp
    weapon_skill.h
    zone_entities.cpp
    zone_entities.h
    zone_instance.cpp
    zone_instance.h
    zone.cpp
    zone.h

    # Testing for modules
    ${CMAKE_SOURCE_DIR}/modules/custom/cpp/custom_module.cpp
    )

add_subdirectory(ai)
add_subdirectory(entities)
add_subdirectory(items)
add_subdirectory(lua)
add_subdirectory(packets)
add_subdirectory(utils)

set(SOURCES
    ${COMMON_SOURCES}
    ${AI_SOURCES}
    ${ENTITY_SOURCES}
    ${ITEM_SOURCES}
    ${LUA_SOURCES}
    ${PACKET_SOURCES}
    ${UTIL_SOURCES}
    ${CMAKE_CURRENT_SOURCE_DIR}/ability.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/ability.h
    ${CMAKE_CURRENT_SOURCE_DIR}/alliance.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/alliance.h
    ${CMAKE_CURRENT_SOURCE_DIR}/anticheat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/anticheat.h
    ${CMAKE_CURRENT_SOURCE_DIR}/attack.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/attack.h
    ${CMAKE_CURRENT_SOURCE_DIR}/attackround.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/attackround.h
    ${CMAKE_CURRENT_SOURCE_DIR}/autotranslate.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/autotranslate.h
    ${CMAKE_CURRENT_SOURCE_DIR}/battlefield_handler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/battlefield_handler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/battlefield.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/battlefield.h
    ${CMAKE_CURRENT_SOURCE_DIR}/blue_spell.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/blue_spell.h
    ${CMAKE_CURRENT_SOURCE_DIR}/blue_trait.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/blue_trait.h
    ${CMAKE_CURRENT_SOURCE_DIR}/campaign_handler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/campaign_handler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/campaign_system.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/campaign_system.h
    ${CMAKE_CURRENT_SOURCE_DIR}/char_recast_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/char_recast_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/command_handler.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/command_handler.h
    ${CMAKE_CURRENT_SOURCE_DIR}/conquest_system.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/conquest_system.h
    ${CMAKE_CURRENT_SOURCE_DIR}/daily_system.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/daily_system.h
    ${CMAKE_CURRENT_SOURCE_DIR}/enmity_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/enmity_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/event_info.h
    ${CMAKE_CURRENT_SOURCE_DIR}/grades.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/grades.h
    ${CMAKE_CURRENT_SOURCE_DIR}/guild.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/guild.h
    ${CMAKE_CURRENT_SOURCE_DIR}/instance_loader.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/instance_loader.h
    ${CMAKE_CURRENT_SOURCE_DIR}/instance.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/instance.h
    ${CMAKE_CURRENT_SOURCE_DIR}/item_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/item_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/items.h
    ${CMAKE_CURRENT_SOURCE_DIR}/job_points.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/job_points.h
    ${CMAKE_CURRENT_SOURCE_DIR}/latent_effect_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/latent_effect_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/latent_effect.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/latent_effect.h
    ${CMAKE_CURRENT_SOURCE_DIR}/linkshell.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/linkshell.h
    ${CMAKE_CURRENT_SOURCE_DIR}/map.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/map.h
    ${CMAKE_CURRENT_SOURCE_DIR}/merit.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/merit.h
    ${CMAKE_CURRENT_SOURCE_DIR}/message.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/message.h
    ${CMAKE_CURRENT_SOURCE_DIR}/mob_modifier.h
    ${CMAKE_CURRENT_SOURCE_DIR}/mob_spell_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/mob_spell_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/mob_spell_list.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/mob_spell_list.h
    ${CMAKE_CURRENT_SOURCE_DIR}/mobskill.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/mobskill.h
    ${CMAKE_CURRENT_SOURCE_DIR}/modifier.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/modifier.h
    ${CMAKE_CURRENT_SOURCE_DIR}/navmesh.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/navmesh.h
    ${CMAKE_CURRENT_SOURCE_DIR}/notoriety_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/notoriety_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/packet_guard.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/packet_guard.h
    ${CMAKE_CURRENT_SOURCE_DIR}/packet_system.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/packet_system.h
    ${CMAKE_CURRENT_SOURCE_DIR}/party.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/party.h
    ${CMAKE_CURRENT_SOURCE_DIR}/recast_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/recast_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/region.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/region.h
    ${CMAKE_CURRENT_SOURCE_DIR}/roe.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/roe.h
    ${CMAKE_CURRENT_SOURCE_DIR}/spell.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/spell.h
    ${CMAKE_CURRENT_SOURCE_DIR}/status_effect_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/status_effect_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/status_effect.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/status_effect.h
    ${CMAKE_CURRENT_SOURCE_DIR}/time_server.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/time_server.h
    ${CMAKE_CURRENT_SOURCE_DIR}/timetriggers.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/timetriggers.h
    ${CMAKE_CURRENT_SOURCE_DIR}/trade_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/trade_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/trait.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/trait.h
    ${CMAKE_CURRENT_SOURCE_DIR}/transport.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/transport.h
    ${CMAKE_CURRENT_SOURCE_DIR}/treasure_pool.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/treasure_pool.h
    ${CMAKE_CURRENT_SOURCE_DIR}/unitychat.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/unitychat.h
    ${CMAKE_CURRENT_SOURCE_DIR}/universal_container.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/universal_container.h
    ${CMAKE_CURRENT_SOURCE_DIR}/vana_time.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/vana_time.h
    ${CMAKE_CURRENT_SOURCE_DIR}/weapon_skill.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/weapon_skill.h
    ${CMAKE_CURRENT_SOURCE_DIR}/zone_entities.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/zone_entities.h
    ${CMAKE_CURRENT_SOURCE_DIR}/zone_instance.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/zone_instance.h
    ${CMAKE_CURRENT_SOURCE_DIR}/zone.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/zone.h
)

if(UNIX)
    set(resource "")
else()
    set(resource "${CMAKE_SOURCE_DIR}/res/mapserver.rc")
endif()

# Search for module directories
set(module_include_dirs "")
file(STRINGS ${CMAKE_SOURCE_DIR}/modules/init.txt INIT_FILE_ENTRIES REGEX "^[^#\n].*")
foreach(entry ${INIT_FILE_ENTRIES})
    if (${entry} STREQUAL "")
        continue()
    endif()
    if (IS_DIRECTORY "${CMAKE_SOURCE_DIR}/modules/${entry}")
        file(GLOB_RECURSE module_files
            "${CMAKE_SOURCE_DIR}/modules/${entry}/*.cpp"
            "${CMAKE_SOURCE_DIR}/modules/${entry}/*.h")
        list(APPEND module_include_dirs "${CMAKE_SOURCE_DIR}/modules/${entry}")
        list(APPEND SOURCES ${module_files})
        message(STATUS "Adding module files to build: ${module_files}")
    elseif (${entry} MATCHES "\.cpp")
        list(APPEND SOURCES "${CMAKE_SOURCE_DIR}/modules/${entry}")
        message(STATUS "Adding module files to build: ${CMAKE_SOURCE_DIR}/modules/${entry}")
    endif()
endforeach()

add_executable(xi_map
    ${SOURCES}
    ${resource})

if(WIN32)
    set_target_properties(xi_map PROPERTIES OUTPUT_NAME xi_map)
endif()

target_compile_definitions(
    xi_map
    PUBLIC
    -DdsUDPSERV
    -DDEBUGLOGMAP
)

target_link_libraries(xi_map
    PUBLIC
        ${EXTERNAL_LIBS}
        project_options
    PRIVATE
        project_warnings
)

target_include_directories(xi_map
    PUBLIC
        ${CMAKE_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${module_include_dirs}
)

target_precompile_headers(xi_map PUBLIC pch.h)

if(TRACY_ENABLE)
    target_link_libraries(xi_map PUBLIC tracy_client)
endif(TRACY_ENABLE)

set_target_output_directory(xi_map)
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT xi_map)
