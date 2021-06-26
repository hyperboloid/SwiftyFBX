//
//  FBXNode.h
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXNode : NSObject
@property (nonatomic, getter=getTranslation, setter=setTranslation:) Position translation;
@property (nonatomic, getter=getRotation, setter=setRotation:) Position rotation;
@property (nonatomic, getter=getScale, setter=setScale:) Position scale;
@property (nonatomic, getter=getTarget, setter=setTarget:) FBXNode *target;
@end

NS_ASSUME_NONNULL_END
