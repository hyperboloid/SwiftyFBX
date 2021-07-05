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
#import "FBXNode_Internal.h"
#import "FBXSurfaceMaterial_Internal.h"


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
    const char *cName = [name cStringUsingEncoding: NSASCIIStringEncoding];
    FbxCamera* cCamera = FbxCamera::Create(manager, cName);
    FbxNode* node = FbxNode::Create(manager, cName);
    node->SetNodeAttribute(cCamera);
    return [[FBXCamera alloc] initWithCCamera:cCamera];
}

- (FBXMarker*)createMarkerWithName:(NSString*)name {
    const char *cName = [name cStringUsingEncoding: NSASCIIStringEncoding];
    FbxMarker* cMarker = FbxMarker::Create(manager, cName);
    FbxNode* node = FbxNode::Create(manager, cName);
    node->SetNodeAttribute(cMarker);
    return [[FBXMarker alloc] initWithCMarker:cMarker];
}

- (FBXSurfaceMaterial*)createPhongMaterialWithName:(NSString*)name {
    const char *cName = [name cStringUsingEncoding: NSASCIIStringEncoding];
    FbxSurfacePhong* cPhong = FbxSurfacePhong::Create(manager, cName);
    return [[FBXSurfaceMaterial alloc] initWithCMaterial:cPhong];
}

- (void)exportScene:(FBXScene*)scene fbxFilename:(NSString*)filename {
    ios->SetBoolProp(EXP_FBX_EMBEDDED, true);

    FbxExporter *exporter = FbxExporter::Create(manager, "Exporter");
    const char* cFilename = [filename cStringUsingEncoding: NSASCIIStringEncoding];
    exporter->Initialize(cFilename, -1, ios);
    exporter->Export([scene getCScene]);
    exporter->Destroy();
}

@end
