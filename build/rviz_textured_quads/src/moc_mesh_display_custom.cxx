/****************************************************************************
** Meta object code from reading C++ file 'mesh_display_custom.h'
**
** Created by: The Qt Meta Object Compiler version 63 (Qt 4.8.7)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../src/rviz_textured_quads/src/mesh_display_custom.h"
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mesh_display_custom.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 63
#error "This file was generated using the moc from 4.8.7. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
static const uint qt_meta_data_rviz__MeshDisplayCustom[] = {

 // content:
       6,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: signature, parameters, type, tag, flags
      25,   24,   24,   24, 0x08,
      48,   24,   24,   24, 0x08,

       0        // eod
};

static const char qt_meta_stringdata_rviz__MeshDisplayCustom[] = {
    "rviz::MeshDisplayCustom\0\0"
    "updateMeshProperties()\0updateDisplayImages()\0"
};

void rviz::MeshDisplayCustom::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Q_ASSERT(staticMetaObject.cast(_o));
        MeshDisplayCustom *_t = static_cast<MeshDisplayCustom *>(_o);
        switch (_id) {
        case 0: _t->updateMeshProperties(); break;
        case 1: _t->updateDisplayImages(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

const QMetaObjectExtraData rviz::MeshDisplayCustom::staticMetaObjectExtraData = {
    0,  qt_static_metacall 
};

const QMetaObject rviz::MeshDisplayCustom::staticMetaObject = {
    { &rviz::Display::staticMetaObject, qt_meta_stringdata_rviz__MeshDisplayCustom,
      qt_meta_data_rviz__MeshDisplayCustom, &staticMetaObjectExtraData }
};

#ifdef Q_NO_DATA_RELOCATION
const QMetaObject &rviz::MeshDisplayCustom::getStaticMetaObject() { return staticMetaObject; }
#endif //Q_NO_DATA_RELOCATION

const QMetaObject *rviz::MeshDisplayCustom::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->metaObject : &staticMetaObject;
}

void *rviz::MeshDisplayCustom::qt_metacast(const char *_clname)
{
    if (!_clname) return 0;
    if (!strcmp(_clname, qt_meta_stringdata_rviz__MeshDisplayCustom))
        return static_cast<void*>(const_cast< MeshDisplayCustom*>(this));
    if (!strcmp(_clname, "Ogre::RenderTargetListener"))
        return static_cast< Ogre::RenderTargetListener*>(const_cast< MeshDisplayCustom*>(this));
    if (!strcmp(_clname, "Ogre::RenderQueueListener"))
        return static_cast< Ogre::RenderQueueListener*>(const_cast< MeshDisplayCustom*>(this));
    typedef rviz::Display QMocSuperClass;
    return QMocSuperClass::qt_metacast(_clname);
}

int rviz::MeshDisplayCustom::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    typedef rviz::Display QMocSuperClass;
    _id = QMocSuperClass::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
