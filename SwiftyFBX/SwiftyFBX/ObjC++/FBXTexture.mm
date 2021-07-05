//
//  FBXTexture.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/17.
//

#import "FBXTexture.h"
#import "FBXTexture_Internal.h"
#import <fbxsdk.h>

@implementation FBXTexture
{
    FbxTexture* _cTexture;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _url = nil;
    }
    return self;
}

- (instancetype)initWithCTexture:(FbxTexture* )cTexture
{
    self = [self init];
    if(cTexture == NULL) {
        return self;
    }
    
    _cTexture = cTexture;
    
    FbxFileTexture* cFileTexture = FbxCast<FbxFileTexture>(cTexture);
    NSString *filePath = [NSString stringWithCString:cFileTexture->GetFileName() encoding:NSUTF8StringEncoding];
    if (filePath != nil) {
        _url = [NSURL fileURLWithPath:filePath];
    }
    
    return self;
}

- (FbxTexture *)getTexture {
    return _cTexture;
}

@end
