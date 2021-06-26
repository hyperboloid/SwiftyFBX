//
//  FBXMesh.m
//  SwiftyFBX
//
//  Created by Hiroaki ENDOH on 2021/01/06.
//

#import "FBXMesh.h"
#import "FBXMesh_Internal.h"
#import "FBXLayerElementNormal.h"
#import "FBXLayerElementNormal_Internal.h"
#import "FBXNode.h"
#import "FBXNode_Internal.h"
#import "FBXStruct.h"
#import "FBXPoint.h"
#import <fbxsdk.h>

@implementation FBXMesh
{
    FbxMesh* _cMesh;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cMesh = NULL;
    }
    return self;
}

- (instancetype)initWithCMesh:(FbxMesh* )cMesh
{
    self = [self init];
    if(cMesh == NULL) {
        return self;
    }
    
    _cMesh = cMesh;
    
    return self;
}

- (FBXNode*)getNode
{
    if (_cMesh == NULL) {
        return [[FBXNode alloc] init];
    }
    
    FbxNode* node = _cMesh->GetNode();
    if (node == NULL) {
        return [[FBXNode alloc] init];
    }

    return [[FBXNode alloc] initWithCNode:node];
}

- (NSString *)getName
{
    if (_cMesh == NULL) {
        return @"";
    }

    NSString *name = [NSString stringWithCString:_cMesh->GetName() encoding:NSUTF8StringEncoding];
    if (name == nil) {
        return @"";
    }

    return name;
}

- (Position)getTranslation
{
    if (_cMesh == NULL) {
        return PositionZero;
    }
    
    return self.node.translation;
}

- (Position)getRotation
{
    if (_cMesh == NULL) {
        return PositionZero;
    }
    
    return self.node.rotation;
}

- (Position)getScale
{
    if (_cMesh == NULL) {
        return PositionZero;
    }
    
    return self.node.scale;
}

- (int)getControlPointsCount
{
    if (_cMesh == NULL) {
        return 0;
    }
    return _cMesh->GetControlPointsCount();
}

- (NSArray<FBXPoint*>*)getControlPoints
{
    NSMutableArray<FBXPoint*> *controlPoints = [NSMutableArray array];
    
    if (_cMesh == NULL) {
        return controlPoints;
    }
    
    FbxVector4* points = _cMesh->GetControlPoints();
    if (points == NULL) {
        return controlPoints;
    }

    int lengthOfMData = std::extent<decltype(points->mData)>::value;
    if (lengthOfMData < 3) {
        return controlPoints;
    }

    int pointCount = _cMesh->GetControlPointsCount();
    for (int i = 0; i < pointCount; i++) {
        FBXPoint *point = [FBXPoint pointWithX:points[i][0] y:points[i][1] z:points[i][2]];
        [controlPoints addObject:point];
    }
    
    return controlPoints;
}

- (int)getElementNormalCount
{
    if (_cMesh == NULL) {
        return NULL;
    }
    return _cMesh->GetElementNormalCount();
}

- (FBXLayerElementNormal *)getElementNormal
{
    if (_cMesh == NULL) {
        return nil;
    }

    FbxGeometryElementNormal* cNormal = _cMesh->GetElementNormal();
    if (cNormal == NULL) {
        return nil;
    }
    
    return [FBXLayerElementNormal createWithCLayerElementNormal:(FbxLayerElementNormal*)cNormal];
}

- (FBXLayerElementNormal *)getElementNormalAtIndex:(int)index
{
    FbxGeometryElementNormal* cNormals = _cMesh->GetElementNormal(index);
    return [FBXLayerElementNormal createWithCLayerElementNormal:cNormals];
}

- (void)getElementTangentCount
{
    _cMesh->GetElementTangentCount();
}

- (void)GetElementTangentAtIndex:(int)index
{
    _cMesh->GetElementTangent(index);
}

- (int)getPolygonCount
{
    if (_cMesh == NULL) {
        return 0;
    }
        
    return _cMesh->GetPolygonCount();
}

- (NSArray<FBXPoint*>*)getPolygonVertices
{
    NSMutableArray<FBXPoint*> *vertices = [NSMutableArray array];
    
    if (_cMesh == NULL) {
        return vertices;
    }
    
    int* polygonVertices = _cMesh->GetPolygonVertices();
    if (polygonVertices == NULL) {
        return vertices;
    }
    
    int polygonVertexCount = [self getPolygonVertexCount];
    if (polygonVertexCount < 1) {
        return vertices;
    }
    
    FbxVector4* controlPoints = _cMesh->GetControlPoints();
    if (controlPoints == NULL) {
        return vertices;
    }
        
    for (int i = 0; i < polygonVertexCount; i++) {
        int cursor = polygonVertices[i];
        FBXPoint *point = [FBXPoint pointWithX:controlPoints[cursor][0]
                                             y:controlPoints[cursor][1]
                                             z:controlPoints[cursor][2]];
        [vertices addObject:point];
    }
    
    return vertices;
}

- (int)getPolygonVertexCount
{
    if (_cMesh == NULL) {
        return 0;
    }
        
    return _cMesh->GetPolygonVertexCount();
}

- (NSArray<FBXPoint*>*)getPolygonVertexNormals
{
    NSMutableArray *polygonVertexNormals = [NSMutableArray array];
    if (_cMesh == NULL) {
        return polygonVertexNormals;
    }
        
    FbxArray<fbxsdk::FbxVector4> normals;
    BOOL status = _cMesh->GetPolygonVertexNormals(normals);
    if (!status || normals.GetCount() < 1) {
        return polygonVertexNormals;
    }
    
    FbxVector4 hoge = normals.GetFirst();
    int lengthOfMData = std::extent<decltype(hoge.mData)>::value;
    if (lengthOfMData < 3) {
        return polygonVertexNormals;
    }

    for (int i = 0; i < normals.Size(); i++) {
        FBXPoint *normal = [FBXPoint pointWithX:normals[i][0]
                                              y:normals[i][1]
                                              z:normals[i][2]];
        [polygonVertexNormals addObject:normal];
    }
    
    return polygonVertexNormals;
}

- (void)getElementPolygonGroupCount
{
    _cMesh->GetElementPolygonGroupCount();
}

- (void)getElementPolygonGroup
{
    _cMesh->GetElementPolygonGroup();
}

- (void)getPolygonSizeAtIndex:(int)index
{
    _cMesh->GetPolygonSize(index);
}

- (void)getPolygonVertexAtIndexPath:(NSIndexPath*)indexPath
{
    _cMesh->GetPolygonVertex(0, 0);
}

- (void)getElementVertexColorCount
{
    _cMesh->GetElementVertexColorCount();
}

- (void)getElementVertexColorAtIndex:(int)index
{
    _cMesh->GetElementVertexColor(index);
}

- (void)getElementUVCount
{
    _cMesh->GetElementUVCount();
}

- (void)getElementUVAtIndex:(int)index
{
    _cMesh->GetElementUV(index);
}

- (void)getTextureUVIndex
{
    _cMesh->GetTextureUVIndex(0, 0);
}

- (void)getElementMaterialCount
{
    _cMesh->GetElementMaterialCount();
}

- (void)getElementMaterialAtIndex:(int)index
{
    _cMesh->GetElementMaterial(index);
}

- (void)getElementVisibilityCount
{
    _cMesh->GetElementVisibilityCount();
}

- (void)getElementVisibilityAtIndex:(int)index
{
    _cMesh->GetElementVisibility(index);
}
@end
