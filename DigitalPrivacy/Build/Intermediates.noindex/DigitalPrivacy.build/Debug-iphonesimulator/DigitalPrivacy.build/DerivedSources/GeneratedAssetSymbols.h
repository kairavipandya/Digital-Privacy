#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "facebook" asset catalog image resource.
static NSString * const ACImageNameFacebook AC_SWIFT_PRIVATE = @"facebook";

/// The "instagram" asset catalog image resource.
static NSString * const ACImageNameInstagram AC_SWIFT_PRIVATE = @"instagram";

/// The "snapchat" asset catalog image resource.
static NSString * const ACImageNameSnapchat AC_SWIFT_PRIVATE = @"snapchat";

/// The "twitter" asset catalog image resource.
static NSString * const ACImageNameTwitter AC_SWIFT_PRIVATE = @"twitter";

#undef AC_SWIFT_PRIVATE
