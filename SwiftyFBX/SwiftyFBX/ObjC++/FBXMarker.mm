//
//  FBXMarker.mm
//  SwiftyFBX
//
//  Created by Michael Wilson on 6/24/21.
//

#import "FBXMarker.h"
#import "FBXMarker_Internal.h"
#import <fbxsdk.h>
#import "FBXNode_Internal.h"

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

- (FBXNode*)getNode
{
    if (_cMarker == NULL) {
        return [[FBXNode alloc] init];
    }
    
    FbxNode* node = _cMarker->GetNode();
    if (node == NULL) {
        return [[FBXNode alloc] init];
    }

    return [[FBXNode alloc] initWithCNode:node];
}

@end
