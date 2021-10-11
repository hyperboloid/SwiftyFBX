//
//  FBXSurfaceMaterial.mm
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/24.
//

#import "FBXSurfaceMaterial.h"
#import "FBXSurfaceMaterial_Internal.h"
#import "FBXTexture.h"
#import "FBXTexture_Internal.h"
#import "FBXColor.h"
#import <fbxsdk.h>

@implementation FBXSurfaceMaterial
{
    FbxSurfaceMaterial* _cMaterial;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cMaterial = NULL;
    }
    return self;
}

- (instancetype)initWithCMaterial:(FbxSurfaceMaterial *)cMaterial
{
    self = [self init];
    if (cMaterial != NULL) {
        _cMaterial = cMaterial;
    }
    return self;
}

- (FbxSurfaceMaterial *)getMaterial {
    return _cMaterial;
    
}

- (BOOL)isPhong
{
    if (_cMaterial == NULL) {
        return NO;
    }

    return _cMaterial->GetClassId().Is(FbxSurfacePhong::ClassId);
}

- (BOOL)isLambert
{
    if (_cMaterial == NULL) {
        return NO;
    }
    
    return _cMaterial->GetClassId().Is(FbxSurfaceLambert::ClassId);
}

- (NSString *)getUUID
{
    if (_cMaterial == NULL) {
        return nil;
    }
    
    FbxUInt64 uuid = _cMaterial->GetUniqueID();
    return [NSString stringWithFormat:@"%llu", uuid];
}

- (NSString *)getName
{
    if (_cMaterial == NULL) {
        return @"";
    }
    
    const char* pName = _cMaterial->GetName();
    if (pName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pName
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getInitialName
{
    if (_cMaterial == NULL) {
        return @"";
    }
    
    const char* pInitialName = _cMaterial->GetInitialName();
    if (pInitialName == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pInitialName
                              encoding:NSUTF8StringEncoding];
}


- (NSString *)getShadingModelName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sShadingModel;
    if (pValue == NULL) {
        return @"";
    }
    
    FbxPropertyT<FbxString> str = _cMaterial->ShadingModel;
        
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getMultiLayerName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sMultiLayer;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getEmissiveName;
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sEmissive;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getEmissiveFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sEmissiveFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getAmbientName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sAmbient;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getAmbientFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sAmbientFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDiffuseName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDiffuse;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDiffuseFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDiffuseFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getSpecularName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sSpecular;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getSpecularFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sSpecularFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getShininessName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sShininess;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getBumpName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sBump;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getNormalMapName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sNormalMap;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getBumpFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sBumpFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getTransparentColorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sTransparentColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getTransparencyFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sTransparencyFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getReflectionName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sReflection;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getReflectionFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sReflectionFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDisplacementColorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDisplacementColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getDisplacementFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sDisplacementFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getVectorDisplacementColorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sVectorDisplacementColor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getVectorDisplacementFactorName
{
    if (_cMaterial == NULL) {
        return @"";
    }

    const char* pValue = _cMaterial->sVectorDisplacementFactor;
    if (pValue == NULL) {
        return @"";
    }
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];
}

- (NSString *)getShadingModel
{
    if (_cMaterial == NULL) {
        return @"";
    }
    
    FbxPropertyT<FbxString> name = _cMaterial->ShadingModel;
    const char* pValue = name.Get().Buffer();
    
    return [NSString stringWithCString:pValue
                              encoding:NSUTF8StringEncoding];

}

- (FBXColor *)getAmbient
{
    if (_cMaterial == NULL) {
        return [FBXColor empty];
    }
    
    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble3> cAmbient = cPhong->Ambient;
    
    return [[FBXColor alloc] initWithRed:cAmbient.Get()[0]
                                   green:cAmbient.Get()[1]
                                    blue:cAmbient.Get()[2]
                                   alpha:0.0f];
}

- (void)setAmbient:(FBXColor *)ambient {
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        FbxDouble3 ambientColor(ambient.red, ambient.green, ambient.blue);
        cPhong->Ambient.Set(ambientColor);
    }
}

- (FBXColor *)getDiffuse
{
    if (_cMaterial == NULL) {
        return [FBXColor empty];
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble3> cDiffuse = cPhong->Diffuse;
    
    return [[FBXColor alloc] initWithRed:cDiffuse.Get()[0]
                                   green:cDiffuse.Get()[1]
                                    blue:cDiffuse.Get()[2]
                                   alpha:0.0f];
}

- (void)setDiffuse:(FBXColor *)diffuse {
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        FbxDouble3 diffuseColor(diffuse.red, diffuse.green, diffuse.blue);
        cPhong->Diffuse.Set(diffuseColor);
    }
}

- (void)setDiffuseTexture:(FBXTexture *)diffuseTexture {
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        cPhong->Diffuse.ConnectSrcObject([diffuseTexture getTexture]);
    }
}

- (FBXColor *)getSpecular
{
    if (_cMaterial == NULL) {
        return [FBXColor empty];
    }
    if (!self.isPhong) {
        return [FBXColor empty];
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble3> cSpecular = cPhong->Specular;
    
    return [[FBXColor alloc] initWithRed:cSpecular.Get()[0]
                                   green:cSpecular.Get()[1]
                                    blue:cSpecular.Get()[2]
                                   alpha:0.0f];

}

- (void)setSpecular:(FBXColor *)specular {
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        FbxDouble3 specularColor(specular.red, specular.green, specular.blue);
        cPhong->Specular.Set(specularColor);
    }
}

- (CGFloat)getSpecularFactor
{
    if (_cMaterial == NULL) {
        return 0.0f;
    }
    if (!self.isPhong) {
        return 0.0f;
    }
    
    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble> cSpecularFactor = cPhong->SpecularFactor;
    
    return cSpecularFactor.Get();
}

- (void)setSpecularFactor:(CGFloat)specularFactor
{
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        cPhong->SpecularFactor.Set(specularFactor);
    }
}

- (FBXColor *)getEmissive
{
    if (_cMaterial == NULL) {
        return [FBXColor empty];
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble3> cEmissive = cPhong->Emissive;
    
    return [[FBXColor alloc] initWithRed:cEmissive.Get()[0]
                                   green:cEmissive.Get()[1]
                                    blue:cEmissive.Get()[2]
                                   alpha:0.0f];
}

- (void)setEmissive:(FBXColor *)emissive {
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        FbxDouble3 emissiveColor(emissive.red, emissive.green, emissive.blue);
        cPhong->Emissive.Set(emissiveColor);
    }
}

- (FBXColor *)getTransparencyColor
{
    if (_cMaterial == NULL) {
        return [FBXColor empty];
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble3> cTransparentColor = cPhong->TransparentColor;
    
    return [[FBXColor alloc] initWithRed:cTransparentColor.Get()[0]
                                   green:cTransparentColor.Get()[1]
                                    blue:cTransparentColor.Get()[2]
                                   alpha:0.0f];
}

- (void)setTransparencyColor:(FBXColor *)transparency
{
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        FbxDouble3 transparentColor(transparency.red, transparency.green, transparency.blue);
        cPhong->TransparentColor.Set(transparentColor);
    }
}

- (CGFloat)getTransparencyFactor
{
    if (_cMaterial == NULL) {
        return 0.0f;
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble> cTransparencyFactor = cPhong->TransparencyFactor;
    
    return cTransparencyFactor.Get();
}

- (void)setTransparencyFactor:(CGFloat)transparencyFactor
{
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        cPhong->TransparencyFactor.Set(transparencyFactor);
    }
}

- (CGFloat)getShininess
{
    if (_cMaterial == NULL) {
        return 0.0f;
    }
    if (!self.isPhong) {
        return 0.0f;
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble> cShininess = cPhong->Shininess;
    
    return cShininess.Get();
}

- (void)setShininess:(CGFloat)shininess
{
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        cPhong->Shininess.Set(shininess);
    }
}

- (FBXColor *)getReflectionColor
{
    if (_cMaterial == NULL) {
        return [FBXColor empty];
    }
    if (!self.isPhong) {
        return [FBXColor empty];
    }

    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble3> cReflectionColor = cPhong->Reflection;
    
    return [[FBXColor alloc] initWithRed:cReflectionColor.Get()[0]
                                   green:cReflectionColor.Get()[1]
                                    blue:cReflectionColor.Get()[2]
                                   alpha:0.0f];
}

- (void)setReflectionColor:(FBXColor *)reflection
{
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        FbxDouble3 reflectionColor(reflection.red, reflection.green, reflection.blue);
        cPhong->Reflection.Set(reflectionColor);
    }
}

- (void)setReflectionTexture:(FBXTexture *)reflectionTexture {
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        cPhong->Reflection.ConnectSrcObject([reflectionTexture getTexture]);
    }
}

- (CGFloat)getReflectionFactor
{
    if (_cMaterial == NULL) {
        return 0.0f;
    }
    if (!self.isPhong) {
        return 0.0f;
    }
    
    FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
    FbxPropertyT<FbxDouble> cReflectionFactor = cPhong->ReflectionFactor;
    
    return cReflectionFactor.Get();
}

- (void)setReflectionFactor:(CGFloat)reflectionFactor
{
    if (self.isPhong) {
        FbxSurfacePhong* cPhong = (FbxSurfacePhong*)_cMaterial;
        cPhong->ReflectionFactor.Set(reflectionFactor);
    }
}

@end
