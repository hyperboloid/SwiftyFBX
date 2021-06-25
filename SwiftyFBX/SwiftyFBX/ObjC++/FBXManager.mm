//
//  FBXManager.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/05.
//

#import "FBXManager.h"
#import "SwiftyFBXLoader.h"
#import <fbxsdk.h>
#import "FBXScene_Internal.h"
#import "FBXMarker_Internal.h"
#import "FBXCamera_Internal.h"


@implementation FBXManager {
    FbxManager *manager;
    FbxIOSettings* ios;
}

- (instancetype) init {
    if (self = [super init]) {
        manager = FbxManager::Create();
        ios = FbxIOSettings::Create(manager, IOSROOT);
        manager->SetIOSettings(ios);
    }
    return self;
}

- (FBXScene*)createSceneWithName:(NSString*)name {
    FBXScene* scene = [[FBXScene alloc] initWithCScene:FbxScene::Create(manager, [name cStringUsingEncoding: NSASCIIStringEncoding])];
    return scene;
}

- (FBXCamera*)createCameraWithName:(NSString*)name {
    FBXCamera* camera = [[FBXCamera alloc] initWithCCamera:FbxCamera::Create(manager, [name cStringUsingEncoding: NSASCIIStringEncoding])];
    return camera;
}

- (FBXMarker*)createMarkerWithName:(NSString*)name {
    FBXMarker* marker = [[FBXMarker alloc] initWithCMarker:FbxMarker::Create(manager, [name cStringUsingEncoding: NSASCIIStringEncoding])];
    return marker;
}



@end
