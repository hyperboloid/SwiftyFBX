//
//  FBXMarker.h
//  SwiftyFBX
//
//  Created by Michael Wilson on 6/24/21.
//

#import <Foundation/Foundation.h>
#import "FBXStruct.h"
#import "FBXNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface FBXMarker : NSObject
@property (nonatomic, readonly, getter=getNode) FBXNode *node;
@end

NS_ASSUME_NONNULL_END
