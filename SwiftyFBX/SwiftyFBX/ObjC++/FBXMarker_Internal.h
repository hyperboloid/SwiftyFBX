//
//  FBXMarker_Internal.h
//  SwiftyFBX
//
//  Created by Michael Wilson on 6/24/21.
//

#import <Foundation/Foundation.h>
#import <fbxsdk.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBXMarker ()
- (instancetype)initWithCMarker:(FbxMarker* )cMarker;
@end

NS_ASSUME_NONNULL_END
