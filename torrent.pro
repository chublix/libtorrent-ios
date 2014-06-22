#-------------------------------------------------
#
# Project created by QtCreator 2014-06-17T16:26:25
#
#-------------------------------------------------

QT       -= gui

TARGET = torrent
TEMPLATE = lib
CONFIG += staticlib

DEFINES += BOOST_ASIO_SEPARATE_COMPILATION \
           BOOST_ASIO_ENABLE_CANCELIO \
           BOOST_ASIO_HASH_MAP_BUCKETS=1021 \
           BOOST_FILESYSTEM_VERSION=3 \
           WITH_SHIPPED_GEOIP_H \
           TORRENT_BUILDING_STATIC \
           TORRENT_USE_TOMMATH

SOURCES += \
    src/kademlia/dht_tracker.cpp \
    src/kademlia/find_data.cpp \
    src/kademlia/node.cpp \
    src/kademlia/node_id.cpp \
    src/kademlia/refresh.cpp \
    src/kademlia/routing_table.cpp \
    src/kademlia/rpc_manager.cpp \
    src/kademlia/traversal_algorithm.cpp \
    src/alert.cpp \
    src/allocator.cpp \
    src/asio.cpp \
    src/assert.cpp \
    src/bandwidth_limit.cpp \
    src/bandwidth_manager.cpp \
    src/bandwidth_queue_entry.cpp \
    src/bloom_filter.cpp \
    src/broadcast_socket.cpp \
    src/bt_peer_connection.cpp \
    src/chained_buffer.cpp \
    src/connection_queue.cpp \
    src/ConvertUTF.cpp \
    src/create_torrent.cpp \
    src/disk_buffer_holder.cpp \
    src/disk_buffer_pool.cpp \
    src/disk_io_thread.cpp \
    src/entry.cpp \
    src/enum_net.cpp \
    src/error_code.cpp \
    src/escape_string.cpp \
    src/file.cpp \
    src/file_pool.cpp \
    src/file_storage.cpp \
    src/gzip.cpp \
    src/http_connection.cpp \
    src/http_parser.cpp \
    src/http_seed_connection.cpp \
    src/http_stream.cpp \
    src/http_tracker_connection.cpp \
    src/i2p_stream.cpp \
    src/identify_client.cpp \
    src/instantiate_connection.cpp \
    src/ip_filter.cpp \
    src/lazy_bdecode.cpp \
    src/logger.cpp \
    src/lsd.cpp \
    src/lt_trackers.cpp \
    src/magnet_uri.cpp \
    src/metadata_transfer.cpp \
    src/natpmp.cpp \
    src/packet_buffer.cpp \
    src/parse_url.cpp \
    src/pe_crypto.cpp \
    src/peer_connection.cpp \
    src/piece_picker.cpp \
    src/policy.cpp \
    src/puff.cpp \
    src/random.cpp \
    src/rsa.cpp \
    src/rss.cpp \
    src/session.cpp \
    src/session_impl.cpp \
    src/settings.cpp \
    src/sha1.cpp \
    src/smart_ban.cpp \
    src/socket_io.cpp \
    src/socket_type.cpp \
    src/socks5_stream.cpp \
    src/stat.cpp \
    src/storage.cpp \
    src/string_util.cpp \
    src/thread.cpp \
    src/time.cpp \
    src/timestamp_history.cpp \
    src/torrent.cpp \
    src/torrent_handle.cpp \
    src/torrent_info.cpp \
    src/tracker_manager.cpp \
    src/udp_socket.cpp \
    src/udp_tracker_connection.cpp \
    src/upnp.cpp \
    src/ut_metadata.cpp \
    src/ut_pex.cpp \
    src/utf8.cpp \
    src/utp_socket_manager.cpp \
    src/utp_stream.cpp \
    src/web_connection_base.cpp \
    src/web_peer_connection.cpp \
    src/GeoIP.c \
    src/mpi.c

HEADERS +=
unix {
    target.path = /usr/lib
    INSTALLS += target
}

INCLUDEPATH += $$PWD/include
DEPENDPATH += $$PWD/include

INCLUDEPATH += $$PWD/../torrent-third-party/boost/include
DEPENDPATH += $$PWD/../torrent-third-party/boost/include

LIBS += -L$$PWD/../torrent-third-party/boost/lib -lboost_system -lboost_filesystem
