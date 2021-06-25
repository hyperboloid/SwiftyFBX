//
//  FBXExporter.mm
//  SwiftyFBX
//
//  Created by Michael Wilson on 6/21/21.
//

#include "FBXExporter.h"

@implementation FBXExporter

+ (instancetype)createWithManager:(FBXManager *)manager {
    return [[FBXExporter alloc] init];
}

- (bool)initializeWithFileName:(NSString *)fileName
                    fileformat:(int)fileformat
                    iosettings:(FBXIOSettings *)iosettings {
    return false;
}

- (void)exportWithFBXDocument:(FBXDocument*)document nonBlocking:(bool)nonBlocking {
    
}
@end
