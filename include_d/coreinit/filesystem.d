/* Converted to D from include/coreinit/filesystem.h by htod */
module coreinit.filesystem;
//C     #pragma once
//C     #include <wut.h>
import std.c.wut;

/**
 * \defgroup coreinit_fs Filesystem
 * \ingroup coreinit
 *
 *  First call FSInit to initialise the file system library, then call
 *  FSAddClient to initialise your FSClient structure, then you need to use
 *  FSInitCmdBlock to initialise an FSCmdBlock structure for each command you
 *  want to run in parallel. You must ensure the previous filesystem command
 *  has been completed before reusing the same FSCmdBlock, you do not need to
 *  reinitialise an FSCmdBlock before reusing it.
 *
 *  Calling fsDevInit initializes the stdlib devoptab, allowing for standard
 *  file IO.
 * @{
 */

//C     #ifdef __cplusplus
//C     extern "C" {
//C     #endif

//C     typedef uint32_t FSDirectoryHandle;
extern (C):
alias uint32_t FSDirectoryHandle;
//C     typedef uint32_t FSFileHandle;
alias uint32_t FSFileHandle;
//C     typedef uint32_t FSPriority;
alias uint32_t FSPriority;

//C     typedef struct FSAsyncData FSAsyncData;
//C     typedef struct FSCmdBlock FSCmdBlock;
//C     typedef struct FSClient FSClient;
//C     typedef struct FSDirectoryEntry FSDirectoryEntry;
//C     typedef struct FSStat FSStat;
//C     typedef struct FSStateChangeInfo FSStateChangeInfo;
//C     typedef struct FSMountSource FSMountSource;

//C     typedef enum FSStatus
//C     {
//C        FS_STATUS_OK                     = 0,
//C        FS_STATUS_CANCELLED              = -1,
//C        FS_STATUS_END                    = -2,
//C        FS_STATUS_MAX                    = -3,
//C        FS_STATUS_ALREADY_OPEN           = -4,
//C        FS_STATUS_EXISTS                 = -5,
//C        FS_STATUS_NOT_FOUND              = -6,
//C        FS_STATUS_NOT_FILE               = -7,
//C        FS_STATUS_NOT_DIR                = -8,
//C        FS_STATUS_ACCESS_ERROR           = -9,
//C        FS_STATUS_PERMISSION_ERROR       = -10,
//C        FS_STATUS_FILE_TOO_BIG           = -11,
//C        FS_STATUS_STORAGE_FULL           = -12,
//C        FS_STATUS_JOURNAL_FULL           = -13,
//C        FS_STATUS_UNSUPPORTED_CMD        = -14,
//C        FS_STATUS_MEDIA_NOT_READY        = -15,
//C        FS_STATUS_MEDIA_ERROR            = -17,
//C        FS_STATUS_CORRUPTED              = -18,
//C        FS_STATUS_FATAL_ERROR            = -0x400,
//C     } FSStatus;
enum FSStatus
{
    FS_STATUS_OK,
    FS_STATUS_CANCELLED = -1,
    FS_STATUS_END = -2,
    FS_STATUS_MAX = -3,
    FS_STATUS_ALREADY_OPEN = -4,
    FS_STATUS_EXISTS = -5,
    FS_STATUS_NOT_FOUND = -6,
    FS_STATUS_NOT_FILE = -7,
    FS_STATUS_NOT_DIR = -8,
    FS_STATUS_ACCESS_ERROR = -9,
    FS_STATUS_PERMISSION_ERROR = -10,
    FS_STATUS_FILE_TOO_BIG = -11,
    FS_STATUS_STORAGE_FULL = -12,
    FS_STATUS_JOURNAL_FULL = -13,
    FS_STATUS_UNSUPPORTED_CMD = -14,
    FS_STATUS_MEDIA_NOT_READY = -15,
    FS_STATUS_MEDIA_ERROR = -17,
    FS_STATUS_CORRUPTED = -18,
    FS_STATUS_FATAL_ERROR = -1024,
}

//C     typedef enum FSError
//C     {
//C        FS_ERROR_NOT_INIT                = -0x30001,
//C        FS_ERROR_BUSY                    = -0x30002,
//C        FS_ERROR_CANCELLED               = -0x30003,
//C        FS_ERROR_END_OF_DIR              = -0x30004,
//C        FS_ERROR_END_OF_FILE             = -0x30005,
//C        FS_ERROR_MAX_MOUNT_POINTS        = -0x30010,
//C        FS_ERROR_MAX_VOLUMES             = -0x30011,
//C        FS_ERROR_MAX_CLIENTS             = -0x30012,
//C        FS_ERROR_MAX_FILES               = -0x30013,
//C        FS_ERROR_MAX_DIRS                = -0x30014,
//C        FS_ERROR_ALREADY_OPEN            = -0x30015,
//C        FS_ERROR_ALREADY_EXISTS          = -0x30016,
//C        FS_ERROR_NOT_FOUND               = -0x30017,
//C        FS_ERROR_NOT_EMPTY               = -0x30018,
//C        FS_ERROR_ACCESS_ERROR            = -0x30019,
//C        FS_ERROR_PERMISSION_ERROR        = -0x3001A,
//C        FS_ERROR_DATA_CORRUPTED          = -0x3001B,
//C        FS_ERROR_STORAGE_FULL            = -0x3001C,
//C        FS_ERROR_JOURNAL_FULL            = -0x3001D,
//C        FS_ERROR_UNAVAILABLE_COMMAND     = -0x3001F,
//C        FS_ERROR_UNSUPPORTED_COMMAND     = -0x30020,
//C        FS_ERROR_INVALID_PARAM           = -0x30021,
//C        FS_ERROR_INVALID_PATH            = -0x30022,
//C        FS_ERROR_INVALID_BUFFER          = -0x30023,
//C        FS_ERROR_INVALID_ALIGNMENT       = -0x30024,
//C        FS_ERROR_INVALID_CLIENTHANDLE    = -0x30025,
//C        FS_ERROR_INVALID_FILEHANDLE      = -0x30026,
//C        FS_ERROR_INVALID_DIRHANDLE       = -0x30027,
//C        FS_ERROR_NOT_FILE                = -0x30028,
//C        FS_ERROR_NOT_DIR                 = -0x30029,
//C        FS_ERROR_FILE_TOO_BIG            = -0x3002A,
//C        FS_ERROR_OUT_OF_RANGE            = -0x3002B,
//C        FS_ERROR_OUT_OF_RESOURCES        = -0x3002C,
//C        FS_ERROR_MEDIA_NOT_READY         = -0x30030,
//C        FS_ERROR_MEDIA_ERROR             = -0x30031,
//C        FS_ERROR_WRITE_PROTECTED         = -0x30032,
//C        FS_ERROR_INVALID_MEDIA           = -0x30033,
//C     } FSError;
enum FSError
{
    FS_ERROR_NOT_INIT = -196609,
    FS_ERROR_BUSY = -196610,
    FS_ERROR_CANCELLED = -196611,
    FS_ERROR_END_OF_DIR = -196612,
    FS_ERROR_END_OF_FILE = -196613,
    FS_ERROR_MAX_MOUNT_POINTS = -196624,
    FS_ERROR_MAX_VOLUMES = -196625,
    FS_ERROR_MAX_CLIENTS = -196626,
    FS_ERROR_MAX_FILES = -196627,
    FS_ERROR_MAX_DIRS = -196628,
    FS_ERROR_ALREADY_OPEN = -196629,
    FS_ERROR_ALREADY_EXISTS = -196630,
    FS_ERROR_NOT_FOUND = -196631,
    FS_ERROR_NOT_EMPTY = -196632,
    FS_ERROR_ACCESS_ERROR = -196633,
    FS_ERROR_PERMISSION_ERROR = -196634,
    FS_ERROR_DATA_CORRUPTED = -196635,
    FS_ERROR_STORAGE_FULL = -196636,
    FS_ERROR_JOURNAL_FULL = -196637,
    FS_ERROR_UNAVAILABLE_COMMAND = -196639,
    FS_ERROR_UNSUPPORTED_COMMAND = -196640,
    FS_ERROR_INVALID_PARAM = -196641,
    FS_ERROR_INVALID_PATH = -196642,
    FS_ERROR_INVALID_BUFFER = -196643,
    FS_ERROR_INVALID_ALIGNMENT = -196644,
    FS_ERROR_INVALID_CLIENTHANDLE = -196645,
    FS_ERROR_INVALID_FILEHANDLE = -196646,
    FS_ERROR_INVALID_DIRHANDLE = -196647,
    FS_ERROR_NOT_FILE = -196648,
    FS_ERROR_NOT_DIR = -196649,
    FS_ERROR_FILE_TOO_BIG = -196650,
    FS_ERROR_OUT_OF_RANGE = -196651,
    FS_ERROR_OUT_OF_RESOURCES = -196652,
    FS_ERROR_MEDIA_NOT_READY = -196656,
    FS_ERROR_MEDIA_ERROR = -196657,
    FS_ERROR_WRITE_PROTECTED = -196658,
    FS_ERROR_INVALID_MEDIA = -196659,
}

//C     typedef enum FSMode
//C     {
//C        FS_MODE_READ_OWNER                   = 0x400,
//C        FS_MODE_WRITE_OWNER                  = 0x200,
//C        FS_MODE_EXEC_OWNER                   = 0x100,

//C        FS_MODE_READ_GROUP                   = 0x040,
//C        FS_MODE_WRITE_GROUP                  = 0x020,
//C        FS_MODE_EXEC_GROUP                   = 0x010,

//C        FS_MODE_READ_OTHER                   = 0x004,
//C        FS_MODE_WRITE_OTHER                  = 0x002,
//C        FS_MODE_EXEC_OTHER                   = 0x001,
//C     } FSMode;
enum FSMode
{
    FS_MODE_READ_OWNER = 1024,
    FS_MODE_WRITE_OWNER = 512,
    FS_MODE_EXEC_OWNER = 256,
    FS_MODE_READ_GROUP = 64,
    FS_MODE_WRITE_GROUP = 32,
    FS_MODE_EXEC_GROUP = 16,
    FS_MODE_READ_OTHER = 4,
    FS_MODE_WRITE_OTHER = 2,
    FS_MODE_EXEC_OTHER = 1,
}

//C     typedef enum FSStatFlags
//C     {
//C        FS_STAT_DIRECTORY                = 0x80000000,
//C     } FSStatFlags;
enum FSStatFlags
{
    FS_STAT_DIRECTORY = -2147483648,
}

//C     typedef enum FSVolumeState
//C     {
//C        FS_VOLUME_STATE_INITIAL          = 0,
//C        FS_VOLUME_STATE_READY            = 1,
//C        FS_VOLUME_STATE_NO_MEDIA         = 2,
//C        FS_VOLUME_STATE_INVALID_MEDIA    = 3,
//C        FS_VOLUME_STATE_DIRTY_MEDIA      = 4,
//C        FS_VOLUME_STATE_WRONG_MEDIA      = 5,
//C        FS_VOLUME_STATE_MEDIA_ERROR      = 6,
//C        FS_VOLUME_STATE_DATA_CORRUPTED   = 7,
//C        FS_VOLUME_STATE_WRITE_PROTECTED  = 8,
//C        FS_VOLUME_STATE_JOURNAL_FULL     = 9,
//C        FS_VOLUME_STATE_FATAL            = 10,
//C        FS_VOLUME_STATE_INVALID          = 11,
//C     } FSVolumeState;
enum FSVolumeState
{
    FS_VOLUME_STATE_INITIAL,
    FS_VOLUME_STATE_READY,
    FS_VOLUME_STATE_NO_MEDIA,
    FS_VOLUME_STATE_INVALID_MEDIA,
    FS_VOLUME_STATE_DIRTY_MEDIA,
    FS_VOLUME_STATE_WRONG_MEDIA,
    FS_VOLUME_STATE_MEDIA_ERROR,
    FS_VOLUME_STATE_DATA_CORRUPTED,
    FS_VOLUME_STATE_WRITE_PROTECTED,
    FS_VOLUME_STATE_JOURNAL_FULL,
    FS_VOLUME_STATE_FATAL,
    FS_VOLUME_STATE_INVALID,
}

//C     typedef enum FSMountSourceType
//C     {
//C        FS_MOUNT_SOURCE_SD  = 0,
//C        FS_MOUNT_SOURCE_UNK = 1,
//C     } FSMountSourceType;
enum FSMountSourceType
{
    FS_MOUNT_SOURCE_SD,
    FS_MOUNT_SOURCE_UNK,
}

//C     typedef void(*FSAsyncCallback)(FSClient *, FSCmdBlock *, FSStatus, uint32_t);
alias void  function(FSClient *, FSCmdBlock *, FSStatus , uint32_t )FSAsyncCallback;

//C     struct FSClient
//C     {
//C        UNKNOWN(0x1700);
//C     };
struct FSClient
{
    char [5888]__unk__COUNTER__;
}
//C     CHECK_SIZE(FSClient, 0x1700);

//C     struct FSCmdBlock
//C     {
//C        UNKNOWN(0xA80);
//C     };
struct FSCmdBlock
{
    char [2688]__unk__COUNTER__;
}
//C     CHECK_SIZE(FSCmdBlock, 0xA80);
symbol static_assert

//C     struct FSStat
//C     {
//C        FSStatFlags flags;
//C        FSMode mode;
//C        uint32_t owner;
//C        uint32_t group;
//C        uint32_t size;
//C        UNKNOWN(0x50);
//C     };
struct FSStat
{
    FSStatFlags flags;
    FSMode mode;
    uint32_t owner;
    uint32_t group;
    uint32_t size;
    char [80]__unk__COUNTER__;
}
//C     CHECK_OFFSET(FSStat, 0x00, flags);
symbol static_assert
//C     CHECK_OFFSET(FSStat, 0x10, size);
symbol static_assert
//C     CHECK_SIZE(FSStat, 0x64);
