//
//  FBXExporter.h
//  SwiftyFBX
//
//  Created by Michael Wilson on 6/21/21.
//

#import <Foundation/Foundation.h>
#import "FBXManager.h"
#import "FBXIOSettings.h"
#import "FBXDocument.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXExporter : NSObject
+ (instancetype)createWithManager:(FBXManager*)manager;

- (bool)initializeWithFileName:(NSString*)fileName
                    fileformat:(int)fileformat
                    iosettings:(FBXIOSettings*)iosettings;

- (void)exportWithFBXDocument:(FBXDocument*)document nonBlocking:(bool)nonBlocking;
@end

NS_ASSUME_NONNULL_END
