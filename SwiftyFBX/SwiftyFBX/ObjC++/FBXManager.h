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

NS_ASSUME_NONNULL_BEGIN

@class FBXScene;
@class FBXCamera;
@class FBXMarker;

@interface FBXManager : NSObject
- (FBXScene*)createSceneWithName:(NSString*)name;
- (FBXCamera*)createCameraWithName:(NSString*)name;
- (FBXMarker*)createMarkerWithName:(NSString*)name;
@end

NS_ASSUME_NONNULL_END
