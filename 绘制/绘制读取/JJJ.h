
#ifndef JFCommon_h
#define JFCommon_h

NSString* IPFAGNEGFQDFBSG();

typedef struct Vector{
    float X;
    float Y;
    float Z;
}Vector;


typedef struct FVector2D {
    float X;
    float Y;
} FVector2D;

typedef struct FVector3D {
    float X;
    float Y;
    float Z;
} FVector3D;

typedef struct FVector4D {
    float X;
    float Y;
    float Z;
    float W;
} FVector4D;
typedef struct D3DXMATRIX {
    float _11, _12, _13, _14;
    float _21, _22, _23, _24;
    float _31, _32, _33, _34;
    float _41, _42, _43, _44;
} D3DXMATRIX;
struct VVV2 {
    float X;
    float Y;

    VVV2() {
        this->X = 0;
        this->Y = 0;
    }

    VVV2(float x, float y) {
        this->X = x;
        this->Y = y;
    }

    static VVV2 Zero() {
        return VVV2(0.0f, 0.0f);
    }

    static float Distance(VVV2 a, VVV2 b) {
        VVV2 vector = VVV2(a.X - b.X, a.Y - b.Y);
        return sqrt((vector.X * vector.X) + (vector.Y * vector.Y));
    }

    bool operator!=(const VVV2 &src) const {
        return (src.X != X) || (src.Y != Y);
    }

    VVV2 &operator+=(const VVV2 &v) {
        X += v.X;
        Y += v.Y;
        return *this;
    }

    VVV2 &operator-=(const VVV2 &v) {
        X -= v.X;
        Y -= v.Y;
        return *this;
    }
};

typedef struct Circle2:public VVV2{
    float radius;
    
    Circle2():VVV2(),radius(0){}
    Circle2(float _x,float _y,float _radius):VVV2(_x,_y),radius(_radius){}

} Circle2;

struct VV3 {
    float X;
    float Y;
    float Z;

    VV3() {
        this->X = 0;
        this->Y = 0;
        this->Z = 0;
    }

    VV3(float x, float y, float z) {
        this->X = x;
        this->Y = y;
        this->Z = z;
    }

    VV3 operator+(const VV3 &v) const {
        return VV3(X + v.X, Y + v.Y, Z + v.Z);
    }

    VV3 operator-(const VV3 &v) const {
        return VV3(X - v.X, Y - v.Y, Z - v.Z);
    }

    bool operator==(const VV3 &v) {
        return X == v.X && Y == v.Y && Z == v.Z;
    }

    bool operator!=(const VV3 &v) {
        return !(X == v.X && Y == v.Y && Z == v.Z);
    }

    static VV3 Zero() {
        return VV3(0.0f, 0.0f, 0.0f);
    }

    static float Dot(VV3 lhs, VV3 rhs) {
        return (((lhs.X * rhs.X) + (lhs.Y * rhs.Y)) + (lhs.Z * rhs.Z));
    }

    static float Distance(VV3 a, VV3 b) {
        VV3 vector = VV3(a.X - b.X, a.Y - b.Y, a.Z - b.Z);
        return sqrt(((vector.X * vector.X) + (vector.Y * vector.Y)) + (vector.Z * vector.Z));
    }
};




struct 矩阵 {
    float Matrix[4][4];

    float *operator[](int index) {
        return Matrix[index];
    }
};

struct Quat {
    float x;
    float y;
    float z;
    float w;
};

struct 转换 {
    Quat Rotation;
    VV3 Translation;
    float w;
    VV3 Scale3D;
};

struct FRotator {
    float Pitch;
    float Yaw;
    float Roll;
    
    
};
struct SaveImage
{
    UIImage* Image;
    int HeroID;
};
typedef struct FVectorRect {
    float X;
    float Y;
    float W;
    float H;
} FVectorRect;


struct 最小视图信息 {
    VV3 Location;
    VV3 LocationLocalSpace;
    FRotator Rotation;
    float FOV;
};
typedef struct FTransform {
    FVector4D Rotation;
    FVector3D Translation;
    FVector3D Scale3D;
} FTransform;

#endif
