/* Converted to D from include/nsysnet/socket.h by htod */
module nsysnet.socket;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;
//C     #include <stdint.h>
import std.c.stdint;
//C     #include <sys/time.h>
import std.c.time;
//C     #include <sys/socket.h>
import std.c.socket;

/**
 * \defgroup nsysnet_socket Socket
 * \ingroup nsysnet
 * @{
 */

//C     #define SOL_SOCKET      0xFFFF

const SOL_SOCKET = 0xFFFF;
//C     #define INADDR_ANY      0

const INADDR_ANY = 0;
//C     #define PF_UNSPEC       0
//C     #define PF_INET         2
const PF_UNSPEC = 0;
//C     #define PF_INET6        23
const PF_INET = 2;

const PF_INET6 = 23;
//C     #define AF_UNSPEC       PF_UNSPEC
//C     #define AF_INET         PF_INET
alias PF_UNSPEC AF_UNSPEC;
//C     #define AF_INET6        PF_INET6
alias PF_INET AF_INET;

alias PF_INET6 AF_INET6;
//C     #define SOCK_STREAM     1
//C     #define SOCK_DGRAM      2
const SOCK_STREAM = 1;

const SOCK_DGRAM = 2;
//C     #define MSG_OOB         0x0001
//C     #define MSG_PEEK        0x0002
const MSG_OOB = 0x0001;
//C     #define MSG_DONTWAIT    0x0004
const MSG_PEEK = 0x0002;
//C     #define MSG_DONTROUTE   0x0000  // ???
const MSG_DONTWAIT = 0x0004;
//C     #define MSG_WAITALL     0x0000  // ???
const MSG_DONTROUTE = 0x0000;
//C     #define MSG_MORE        0x0000  // ???
const MSG_WAITALL = 0x0000;
//C     #define MSG_NOSIGNAL    0x0000  // there are no signals
const MSG_MORE = 0x0000;

const MSG_NOSIGNAL = 0x0000;
//C     #define SHUT_RD         0
//C     #define SHUT_WR         1
const SHUT_RD = 0;
//C     #define SHUT_RDWR       2
const SHUT_WR = 1;

const SHUT_RDWR = 2;
//C     #define IPPROTO_IP      0
//C     #define IPPROTO_TCP     6
const IPPROTO_IP = 0;
//C     #define IPPROTO_UDP     17
const IPPROTO_TCP = 6;

const IPPROTO_UDP = 17;
/*
 * SOL_SOCKET options
 */
//C     #define SO_REUSEADDR    0x0004      // reuse address
//C     #define SO_LINGER       0x0080      // linger (no effect?)
const SO_REUSEADDR = 0x0004;
//C     #define SO_OOBINLINE    0x0100      // out-of-band data inline (no effect?)
const SO_LINGER = 0x0080;
//C     #define SO_SNDBUF       0x1001      // send buffer size
const SO_OOBINLINE = 0x0100;
//C     #define SO_RCVBUF       0x1002      // receive buffer size
const SO_SNDBUF = 0x1001;
//C     #define SO_SNDLOWAT     0x1003      // send low-water mark (no effect?)
const SO_RCVBUF = 0x1002;
//C     #define SO_RCVLOWAT     0x1004      // receive low-water mark
const SO_SNDLOWAT = 0x1003;
//C     #define SO_TYPE         0x1008      // get socket type
const SO_RCVLOWAT = 0x1004;
//C     #define SO_ERROR        0x1009      // get socket error
const SO_TYPE = 0x1008;

const SO_ERROR = 0x1009;
//C     typedef uint32_t socklen_t;
extern (C):
alias uint32_t socklen_t;
//C     typedef uint16_t sa_family_t;
alias uint16_t sa_family_t;

//C     struct sockaddr
//C     {
//C        sa_family_t sa_family;
//C        char        sa_data[];
extern char []sa_data;
//C     };

//C     struct sockaddr_storage
//C     {
//C        sa_family_t ss_family;
//C        char        __ss_padding[26];
char [26]__ss_padding;
//C     };
