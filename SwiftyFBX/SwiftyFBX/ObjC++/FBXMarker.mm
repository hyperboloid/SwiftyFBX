//
//  FBXMarker.mm
//  SwiftyFBX
//
//  Created by Michael Wilson on 6/24/21.
//

#import "FBXMarker.h"
#import "FBXMarker_Internal.h"
#import <fbxsdk.h>

@implementation FBXMarker
{
    FbxMarker* _cMarker;
}

- (instancetype)initWithCMarker:(FbxMarker* )cMarker
{
    self = [self init];
    if(cMarker == NULL) {
        return self;
    }
    
    _cMarker = cMarker;
    
    return self;
}

@end
