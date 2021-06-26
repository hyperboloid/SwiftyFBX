//
//  FBXManager.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/05.
//

#import <Foundation/Foundation.h>
#import "FBXScene.h"
#import "FBXCamera.h"
#import "FBXMarker.h"
#import "FBXSurfaceMaterial.h"

NS_ASSUME_NONNULL_BEGIN

@class FBXScene;
@class FBXCamera;
@class FBXMarker;
@class FBXSurfaceMaterial;

@interface FBXManager : NSObject
- (FBXScene*)createSceneWithName:(NSString*)name;
- (FBXCamera*)createCameraWithName:(NSString*)name;
- (FBXMarker*)createMarkerWithName:(NSString*)name;
- (FBXSurfaceMaterial*)createPhongMaterialWithName:(NSString*)name;

- (void)exportScene:(FBXScene*)scene fbxFilename:(NSString*)filename;
//- (void)exportScene:(FBXScene*)scene daeFilename:(NSString*)filename;
@end

NS_ASSUME_NONNULL_END
