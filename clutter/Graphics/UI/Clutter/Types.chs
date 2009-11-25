-- -*-haskell-*-
--  Clutter Types
--
--  Author : Matthew Arsenault
--
--  Created: 5 Sep 2009
--
--  Copyright (C) 2009 Matthew Arsenault
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 3 of the License, or (at your option) any later version.
--
--  This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  Lesser General Public License for more details.
--

{-# LANGUAGE ForeignFunctionInterface,
             TypeSynonymInstances,
             MultiParamTypeClasses,
             ScopedTypeVariables,
             FlexibleInstances #-}

#include <clutter/clutter.h>

{# context lib="clutter" prefix="clutter" #}

--CHECKME: gtk2hs change broke everything. I need to double check what
--they are doing to get the referencing right, but I just want it to
--compile right now.

module Graphics.UI.Clutter.Types (
                                  withGObject,
                                  newGObject,
                                  withGValue,
                                  constrGObject,
                                  makeNewActor,
                                  --TODO: Exports need organizing and stuff

                                  GSSize,
                                  GUnichar,
                                  Word,
                                  GID,
                                  Timestamp,
                                  DeviceID,

                                  Color(..),
                                  ColorPtr,
                                  withColor,

                                  Actor,
                                  ActorClass,
                                  withActor,
                                  withActorClass,
                                  toActor,
                                  newActor,
                                  newActorList,

                                  Rectangle,
                                  RectangleClass,
                                  toRectangle,
                                  withRectangle,
                                  newRectangle,

                                  Text,
                                  TextClass,
                                  toText,
                                  withText,
                                  withTextClass,
                                  newText,

                                  Stage,
                                  StageClass,
                                  withStage,
                                  withStageClass,
                                  newStage,

                                  Container,
                                  ContainerClass,
                                  toContainer,
                                  withContainer,
                                  withContainerClass,

                                  Perspective(..),
                                  PerspectivePtr,
                                  withPerspective,
                                  PickMode(..),
                                  Gravity(..),
                                  RequestMode(..),
                                  ActorFlags(..),
                                  AllocationFlags(..),
                                  RotateAxis(..),

                                  InitError(..),

                                  Event,

                                  EventType(..),
                                  EventFlags(..),
                                  ModifierType(..),
                                  StageState(..),
                                  ScrollDirection(..),

                                  Animation,
                                  AnimationRaw,
                                  AnimationRawClass,
                                  toAnimation,
                                  withAnimation,
                                  mkAnimation,
                                  newAnimationRaw,
                                  getAnimationRaw,

                                  Timeline,
                                  TimelineClass,
                                  withTimeline,
                                  newTimeline,
                                  newTimelineList,

                                  Alpha,
                                  AlphaClass,
                                  withAlpha,
                                  newAlpha,

                                  AnimationMode(..),

                                  TimelineDirection(..),

                                  Interval,
                                  IntervalRaw,
                                  mkInterval,
                                  withInterval,
                                  newIntervalRaw,

                                  Fog(..),
                                  FogPtr,
                                  withFog,

                                  CairoTexture,
                                  CairoTextureClass,
                                  withCairoTexture,
                                  newCairoTexture,

                                  Media,
                                  MediaClass,
                                  withMedia,
                                  withMediaClass,

                                  ChildMeta,
                                  ChildMetaClass,
                                  newChildMeta,

                                  Clone,
                                  CloneRaw,
                                  mkClone,
                                  newCloneRaw,
                                  withClone,

                                  BehaviourClass,
                                  Behaviour,
                                  withBehaviour,
                                  withBehaviourClass,
                                  newBehaviour,
                                  BehaviourForeachFunc,
                                  CBehaviourForeachFunc,
                                  newBehaviourForeachFunc,
                                  BehaviourScaleClass,
                                  BehaviourScale,
                                  withBehaviourScale,
                                  newBehaviourScale,
                                  BehaviourDepthClass,
                                  BehaviourDepth,
                                  withBehaviourDepth,
                                  newBehaviourDepth,
                                  BehaviourEllipseClass,
                                  BehaviourEllipse,
                                  withBehaviourEllipse,
                                  newBehaviourEllipse,
                                  BehaviourOpacityClass,
                                  BehaviourOpacity,
                                  withBehaviourOpacity,
                                  newBehaviourOpacity,
                                  BehaviourRotateClass,
                                  BehaviourRotate,
                                  withBehaviourRotate,
                                  newBehaviourRotate,
                                  BehaviourPathClass,
                                  BehaviourPath,
                                  withBehaviourPath,
                                  newBehaviourPath,

                                  PathClass,
                                  Path,
                                  withPath,
                                  newPath,

                                  Group,
                                  GroupClass,
                                  newGroup,
                                  withGroup,

                                  AlphaFunc,
                                  newAlphaFunc,

                                  RotateDirection(..),
                                  TextureQuality(..),
                                  Texture,
                                  TextureClass,
                                  newTexture,
                                  withTexture,
                                  withTextureClass,

                                  TextureFlags(..),

                                  Shader,
                                  ShaderClass,
                                  withShader,
                                  newShader,

                                  ShaderError(..),

                                  Model,
                                  ModelClass,
                                  withModel,
                                  withModelClass,
                                  newModel,

                                  ModelIter,
                                  ModelIterClass,
                                  withModelIter,
                                  newModelIter,

                                  ListModel,
                                  ListModelClass,
                                  withListModel,
                                  newListModel,

                                  Script,
                                  ScriptClass,
                                  withScript,
                                  newScript,

                                  PathNodeType(..),
                                  PathNode,
                                  PathNodePtr,
                                  Knot,
                                  withPathNode,
                                  newPathNodes,
                                  PathCallback,
                                  CPathCallback,
                                  newPathCallback,

                                  Score,
                                  ScoreClass,
                                  withScore,
                                  newScore,

                                  UnitType(..),

                                  ScriptableClass,
                                  Scriptable,
                                  withScriptableClass,

                                  BindingPool,
                                  newBindingPool,
                                  withBindingPool,

                                  InputDeviceType(..),

                                  GCallback,
                                  CGCallback,
                                  newGCallback,

                                  Geometry,
                                  GeometryPtr,
                                  withGeometry,

                                  Vertex,
                                  VertexPtr,
                                  withVertex,
                                  vertexX,
                                  vertexY,
                                  vertexZ,

                                  ActorBox,
                                  actorBoxX1,
                                  actorBoxY1,
                                  actorBoxX2,
                                  actorBoxY2,
                                  ActorBoxPtr,
                                  withActorBox,

                                --Units,
                                --unUnits
                                  ScriptError(..),
                                  FontFlags(..),

                                  Animatable,
                                  AnimatableClass,
                                  withAnimatable,
                                  withAnimatableClass,

                                  Callback,
                                  CCallback,
                                  newCallback,

                                  ModelForeachFunc,
                                  CModelForeachFunc,
                                  newModelForeachFunc,

                                  RGBData,
                                  mkRGBData,
                                  rgbDataHasAlpha,
                                  rgbDataData,

                                  Activatable(..)

                                 ) where

--FIXME: Conflict with EventType Nothing
import Prelude hiding (Nothing)
import Data.Word

--RGBData stuff
import Data.Ix
-- internal module of GHC
import Data.Array.Base ( MArray, newArray, newArray_, unsafeRead, unsafeWrite,
			 getBounds,
			 getNumElements
                       )

import C2HS hiding (newForeignPtr)
import System.Glib.GObject
import System.Glib.Signals
import System.Glib.GValue (GValue(GValue))
import System.Glib.GList
import System.Glib.Flags
import System.Glib.FFI
import Control.Monad (when, liftM2, join)
import Control.Exception (bracket)


-- gtk2hs changed mkGObject to be a tuple (GObject, objectUnref)
--TODO: Move this
constrGObject = fst mkGObject

--also why the flipped newForeignPtr there?
--from foreign.concurrent or something, and also flipped in System.Glib.FFI


--The name makeNewActor is unfortunate since Path technically isn't an
-- actor but has a floating reference


-- Get rid of the floating
-- reference to get a normal reference clutter actors and gtk widgets
-- have floating references

  -- This is a convenience function to generate a new actor. (not to
-- be confused with 'newActor'. It adds the finalizer with the method
-- described under objectSink. It is basically the same thing as
-- 'makeNewObject' for GtkWidgets, since clutter actors are nearly the
-- same. The only difference is the class constraint, since Actors, etc.
-- shouldn't be Gtk's Object.
--
-- * The constr argument is the contructor of the specific object.
--
makeNewActor :: GObjectClass obj =>
  (ForeignPtr obj -> obj, FinalizerPtr obj) -> IO (Ptr obj) -> IO obj
makeNewActor (constr, objectUnref) generator = do
  objPtr <- generator
  when (objPtr == nullPtr) (fail "makeNewActorObject: object is NULL")
  objectRefSink objPtr
  obj <- newForeignPtr objPtr objectUnref
  return $! constr obj

withGObject::GObjectClass o => o -> (Ptr () -> IO b) -> IO b
withGObject obj act = (withForeignPtr . unGObject . toGObject) obj $ \ptr -> act (castPtr ptr)

newGObject a = makeNewGObject (constrGObject, objectUnref) $ return (castPtr a)

--TODO: Make this castPtr go away
withGValue (GValue gval) = castPtr gval

--this doesn't seem to work since GObjectClass is not here
--I'm not sure if I can work around this. Oh well, I don't think it's that important
-- {# pointer *GObject newtype nocode #}
-- {# class GObjectClass GObject #}

--TODO: Make this go away.
type GSSize = {# type gssize #}
type GUnichar = {# type gunichar #}

-- *** Misc

{# enum ClutterInitError as InitError {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterPickMode as PickMode {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterAllocationFlags as AllocationFlags {underscoreToCase} deriving (Show, Eq, Bounded) #}
{# enum ClutterGravity as Gravity {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterActorFlags as ActorFlags {underscoreToCase} deriving (Show, Eq, Bounded) #}
{# enum ClutterRequestMode as RequestMode {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterRotateAxis as RotateAxis {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterEventType as EventType {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterEventFlags as EventFlags {underscoreToCase} deriving (Show, Eq, Bounded) #}
{# enum ClutterModifierType as ModifierType {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterStageState as StageState {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterScrollDirection as ScrollDirection {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterTimelineDirection as TimelineDirection {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterAnimationMode as AnimationMode {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterRotateDirection as RotateDirection {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterTextureQuality as TextureQuality {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterTextureFlags as TextureFlags {underscoreToCase} deriving (Show, Eq, Bounded) #}
{# enum ClutterShaderError as ShaderError {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterPathNodeType as PathNodeType {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterUnitType as UnitType {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterInputDeviceType as InputDeviceType {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterScriptError as ScriptError {underscoreToCase} deriving (Show, Eq) #}
{# enum ClutterFontFlags as FontFlags {underscoreToCase} deriving (Show, Eq, Bounded) #}

instance Flags EventFlags
instance Flags ActorFlags
instance Flags TextureFlags
instance Flags AllocationFlags
instance Flags FontFlags


type GID = Word32
type Timestamp = Word
type DeviceID = Int

--CHECKME: I'm not sure how to deal with this opaque type
-- {# pointer *ClutterUnits as Units newtype #}

-- unUnits (Units ptr) = ptr

-- *** Color

{# pointer *ClutterColor as ColorPtr -> Color #}

data Color = Color { red :: Word8,
                     green :: Word8,
                     blue :: Word8,
                     alpha :: Word8
                   } deriving (Eq, Show)

instance Storable Color where
  sizeOf _ = {# sizeof ClutterColor #}
  alignment _ = alignment (undefined :: Word8)
  peek p = do
      red <- {# get ClutterColor->red #} p
      blue <- {# get ClutterColor->blue #} p
      green <- {# get ClutterColor->green #} p
      alpha <- {# get ClutterColor->alpha #} p
      return $ Color (cIntConv red) (cIntConv green) (cIntConv blue) (cIntConv alpha)

  poke p (Color r g b a) = do
      {# set ClutterColor->red #} p (cIntConv r)   --FIXME: cIntConv is wrong?
      {# set ClutterColor->green #} p (cIntConv g)
      {# set ClutterColor->blue #} p (cIntConv b)
      {# set ClutterColor->alpha #} p (cIntConv a)

--This seems not right. But it seems to work.
mkColor :: Color -> IO ColorPtr
mkColor col = do cptr <- (malloc :: IO ColorPtr)
                 poke cptr col
                 return cptr

withColor :: Color -> (ColorPtr -> IO a) -> IO a
withColor col = bracket (mkColor col) free

-- *** Actor

{# pointer *ClutterActor as Actor foreign newtype #}

class GObjectClass o => ActorClass o
toActor::ActorClass o => o -> Actor
toActor = unsafeCastGObject . toGObject

withActorClass::ActorClass o => o -> (Ptr Actor -> IO b) -> IO b
withActorClass o = (withActor . toActor) o

newActor :: (ActorClass actor) =>  Ptr actor -> IO Actor
newActor a = makeNewActor (Actor, objectUnref) $ return (castPtr a)

--TODO: this should also go somewhere else??
--CHECKME: Does this actually work?
newActorList :: GSList -> IO [Actor]
newActorList gsl = (fromGSList gsl :: IO [Ptr Actor]) >>= mapM newActor

instance ActorClass Actor
instance ScriptableClass Actor
instance GObjectClass Actor where
  toGObject (Actor a) = constrGObject (castForeignPtr a)
  unsafeCastGObject (GObject o) = Actor (castForeignPtr o)

-- *** Rectangle

{# pointer *ClutterRectangle as Rectangle foreign newtype #}

class GObjectClass o => RectangleClass o
toRectangle::RectangleClass o => o -> Rectangle
toRectangle = unsafeCastGObject . toGObject

newRectangle :: Ptr Actor -> IO Rectangle
newRectangle a = makeNewActor (Rectangle, objectUnref) $ return (castPtr a)

instance RectangleClass Rectangle
instance ActorClass Rectangle
instance GObjectClass Rectangle where
  toGObject (Rectangle r) = constrGObject (castForeignPtr r)
  unsafeCastGObject (GObject o) = Rectangle (castForeignPtr o)

-- *** Text

{# pointer *ClutterText as Text foreign newtype #}

class GObjectClass o => TextClass o
toText::TextClass o => o -> Text
toText = unsafeCastGObject . toGObject

newText :: Ptr Actor -> IO Text
newText a = makeNewActor (Text, objectUnref) $ return (castPtr a)

withTextClass::TextClass o => o -> (Ptr Text -> IO b) -> IO b
withTextClass o = (withText . toText) o


instance TextClass Text
instance ActorClass Text
instance ScriptableClass Text
instance GObjectClass Text where
  toGObject (Text a) = constrGObject (castForeignPtr a)
  unsafeCastGObject (GObject o) = Text (castForeignPtr o)

-- *** Group

{#pointer *ClutterGroup as Group foreign newtype #}

class ActorClass o => GroupClass o
toGroup :: GroupClass o => o -> Group
toGroup = unsafeCastGObject . toGObject

newGroup :: Ptr Actor -> IO Group
newGroup a = makeNewActor (Group, objectUnref) $ return (castPtr a)

instance GroupClass Group
instance ScriptableClass Group
instance ContainerClass Group
instance ActorClass Group
instance GObjectClass Group where
  toGObject (Group g) = constrGObject (castForeignPtr g)
  unsafeCastGObject (GObject o) = Group (castForeignPtr o)

-- *** Container

{# pointer *ClutterContainer as Container foreign newtype #}

class GObjectClass o => ContainerClass o
toContainer :: ContainerClass o => o -> Container
toContainer = unsafeCastGObject . toGObject

withContainerClass::ContainerClass o => o -> (Ptr Container -> IO b) -> IO b
withContainerClass o = (withContainer . toContainer) o

instance ContainerClass Container
instance GObjectClass Container where
  toGObject (Container c) = constrGObject (castForeignPtr c)
  unsafeCastGObject (GObject o) = Container (castForeignPtr o)

-- *** Stage

{# pointer *ClutterStage as Stage foreign newtype #}

class GroupClass o => StageClass o
toStage :: StageClass o => o -> Stage
toStage = unsafeCastGObject . toGObject

withStageClass::StageClass o => o -> (Ptr Stage -> IO b) -> IO b
withStageClass o = (withStage . toStage) o


--Actor class?
newStage :: (ActorClass actor) => Ptr actor -> IO Stage
newStage a = makeNewActor (Stage, objectUnref) $ return (castPtr a)

instance StageClass Stage
instance ContainerClass Stage
instance GroupClass Stage
instance ActorClass Stage
instance ScriptableClass Stage
instance GObjectClass Stage where
  toGObject (Stage s) = constrGObject (castForeignPtr s)
  unsafeCastGObject (GObject o) = Stage (castForeignPtr o)

-- *** Perspective

data Perspective = Perspective {
      perspectiveFovy :: !Float,
      perspectiveAspect :: !Float,
      perspectiveZNear :: !Float,
      perspectiveZFar :: !Float
    } deriving (Show, Eq)

{# pointer *ClutterPerspective as PerspectivePtr -> Perspective #}

instance Storable Perspective where
  sizeOf _ = {# sizeof ClutterPerspective #}
  alignment _ = alignment (undefined :: CFloat)
  peek p = do
      fovy <- {# get ClutterPerspective->fovy #} p
      aspect <- {# get ClutterPerspective->aspect #} p
      z_near <- {# get ClutterPerspective->z_near #} p
      z_far <- {# get ClutterPerspective->z_far #} p
      return $ Perspective (cFloatConv fovy) (cFloatConv aspect) (cFloatConv z_near) (cFloatConv z_far)

  poke p (Perspective fovy aspect z_near z_far) = do
      {# set ClutterPerspective->fovy #} p (cFloatConv fovy)
      {# set ClutterPerspective->aspect #} p (cFloatConv aspect)
      {# set ClutterPerspective->z_near #} p (cFloatConv z_near)
      {# set ClutterPerspective->z_far #} p (cFloatConv z_far)

--This seems not right. But it seems to work.
mkPerspective :: Perspective -> IO PerspectivePtr
mkPerspective pst = do pptr <- (malloc :: IO PerspectivePtr)
                       poke pptr pst
                       return pptr

withPerspective :: Perspective -> (PerspectivePtr -> IO a) -> IO a
withPerspective pst = bracket (mkPerspective pst) free

-- *** ClutterEvent

{# pointer *ClutterEvent as Event foreign newtype #}

-- *** Animation

{# pointer *ClutterAnimation as AnimationRaw foreign newtype #}

data Animation a = Animation a AnimationRaw

withAnimation (Animation _ raw) = withAnimationRaw raw

--CHECKME: does animationraw class make sense to have?
class GObjectClass o => AnimationRawClass o
toAnimation :: AnimationRawClass o => o -> AnimationRaw
toAnimation = unsafeCastGObject . toGObject

mkAnimation :: a -> AnimationRaw -> Animation a
mkAnimation _ raw = Animation (undefined :: a) raw

--CHECKME: Do I actually need this and does it break things?
getAnimationRaw :: Animation a -> AnimationRaw
getAnimationRaw (Animation _ raw) = raw

newAnimationRaw:: Ptr AnimationRaw -> IO AnimationRaw
newAnimationRaw a = makeNewGObject (AnimationRaw, objectUnref) $ return (castPtr a)

instance AnimationRawClass AnimationRaw
instance GObjectClass AnimationRaw where
  toGObject (AnimationRaw a) = constrGObject (castForeignPtr a)
  unsafeCastGObject (GObject o) = AnimationRaw (castForeignPtr o)

--CHECKME:
instance (GObjectClass a) => GObjectClass (Animation a) where
  toGObject (Animation _ (AnimationRaw p)) = constrGObject (castForeignPtr p)
  unsafeCastGObject (GObject o) = Animation (undefined :: a) (AnimationRaw (castForeignPtr o))

-- *** Timeline

--FIXME: DO animations and timelines etc. have floating references or not?
--They don't derive from actor, so I'm going to go with no

{# pointer *ClutterTimeline as Timeline foreign newtype #}

class GObjectClass o => TimelineClass o
toTimeline :: TimelineClass o => o -> Timeline
toTimeline = unsafeCastGObject . toGObject

newTimeline:: Ptr Timeline -> IO Timeline
newTimeline a = makeNewGObject (Timeline, objectUnref) $ return a

newTimelineList :: GSList -> IO [Timeline]
newTimelineList gsl = (fromGSList gsl :: IO [Ptr Timeline]) >>= mapM newTimeline

instance TimelineClass Timeline
instance GObjectClass Timeline where
  toGObject (Timeline t) = constrGObject (castForeignPtr t)
  unsafeCastGObject (GObject o) = Timeline (castForeignPtr o)

-- *** Score

{# pointer *ClutterScore as Score foreign newtype #}

class GObjectClass o => ScoreClass o
toScore::ScoreClass o => o -> Score
toScore = unsafeCastGObject . toGObject

--CHECKME: doesn't derive from Actor, so using makeNewGObject
newScore :: Ptr Score -> IO Score
newScore a = makeNewGObject (Score, objectUnref) $ return (castPtr a)

instance ScoreClass Score
instance GObjectClass Score where
  toGObject (Score r) = constrGObject (castForeignPtr r)
  unsafeCastGObject (GObject o) = Score (castForeignPtr o)

-- *** Alpha

{# pointer *ClutterAlpha as Alpha foreign newtype #}

class GObjectClass o => AlphaClass o
toAlpha :: AlphaClass o => o -> Alpha
toAlpha = unsafeCastGObject . toGObject

newAlpha:: Ptr Alpha -> IO Alpha
newAlpha a = makeNewGObject (Alpha, objectUnref) $ return a

instance AlphaClass Alpha
instance GObjectClass Alpha where
  toGObject (Alpha a) = constrGObject (castForeignPtr a)
  unsafeCastGObject (GObject o) = Alpha (castForeignPtr o)

-- *** AlphaFunc

type AlphaFunc = Alpha -> IO Double
type CAlphaFunc = FunPtr (Ptr Alpha -> Ptr () -> IO CDouble)

newAlphaFunc :: AlphaFunc -> IO CAlphaFunc
newAlphaFunc userfunc = mkAlphaFunc (newAlphaFunc' userfunc)
    where
      newAlphaFunc' :: (Alpha -> IO Double) -> Ptr Alpha -> IO Double
      newAlphaFunc' userfunc aptr = newAlpha aptr >>= userfunc

foreign import ccall "wrapper"
    mkAlphaFunc :: (Ptr Alpha -> IO Double) -> IO CAlphaFunc

-- *** Interval

{# pointer *ClutterInterval as IntervalRaw foreign newtype #}

-- Track the type of the interval with the 1st field
data Interval a = Interval a IntervalRaw

mkInterval :: a -> IntervalRaw -> Interval a
mkInterval _ raw = Interval (undefined :: a) raw

withInterval (Interval _ raw) = withIntervalRaw raw

newIntervalRaw a = makeNewGObject (IntervalRaw, objectUnref) $ return (castPtr a)

instance GObjectClass IntervalRaw where
  toGObject (IntervalRaw i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = IntervalRaw (castForeignPtr o)

-- *** Fog

{# pointer *ClutterFog as FogPtr -> Fog #}

data Fog = Fog { z_near :: Float,
                 z_far :: Float
               } deriving (Eq, Show)

instance Storable Fog where
  sizeOf _ = {# sizeof ClutterFog #}
  alignment _ = alignment (undefined :: Float)
  peek p = do
      znear <- {# get ClutterFog->z_near #} p
      zfar <- {# get ClutterFog->z_far #} p
      return $ Fog (cFloatConv znear) (cFloatConv zfar)
  poke p (Fog zn zf) = do
      {# set ClutterFog->z_near #} p (cFloatConv zn)
      {# set ClutterFog->z_far #} p (cFloatConv zf)

--This seems not right. But it seems to work.
mkFog :: Fog -> IO FogPtr
mkFog col = do cptr <- (malloc :: IO FogPtr)
               poke cptr col
               return cptr

withFog :: Fog -> (FogPtr -> IO a) -> IO a
withFog col = bracket (mkFog col) free

-- *** CairoTexture

{# pointer *ClutterCairoTexture as CairoTexture foreign newtype #}

class GObjectClass o => CairoTextureClass o
toCairoTexture :: CairoTextureClass o => o -> CairoTexture
toCairoTexture = unsafeCastGObject . toGObject

newCairoTexture a = makeNewGObject (CairoTexture, objectUnref) $ return (castPtr a)

instance CairoTextureClass CairoTexture
instance GObjectClass CairoTexture where
  toGObject (CairoTexture i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = CairoTexture (castForeignPtr o)

-- *** Media

{# pointer *ClutterMedia as Media foreign newtype #}

withMediaClass::MediaClass o => o -> (Ptr Media -> IO b) -> IO b
withMediaClass o = (withMedia . toMedia) o

class GObjectClass o => MediaClass o
toMedia :: MediaClass o => o -> Media
toMedia = unsafeCastGObject . toGObject

newMedia a = makeNewGObject (Media, objectUnref) $ return (castPtr a)

instance MediaClass Media
instance GObjectClass Media where
  toGObject (Media i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Media (castForeignPtr o)

-- *** ChildMeta

{# pointer *ClutterChildMeta as ChildMeta foreign newtype #}

class GObjectClass o => ChildMetaClass o
toChildMeta :: ChildMetaClass o => o -> Media
toChildMeta = unsafeCastGObject . toGObject

newChildMeta a = makeNewGObject (ChildMeta, objectUnref) $ return (castPtr a)

instance ChildMetaClass ChildMeta
instance GObjectClass ChildMeta where
  toGObject (ChildMeta i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = ChildMeta (castForeignPtr o)

-- *** Clone

{# pointer *ClutterClone as CloneRaw foreign newtype #}

data Clone a = Clone a CloneRaw

newCloneRaw a = makeNewActor (CloneRaw, objectUnref) $ return (castPtr a)

mkClone :: (ActorClass a) => a -> CloneRaw -> Clone a
mkClone _ raw = Clone (undefined :: a) raw

withClone (Clone _ raw) = withCloneRaw raw


class GObjectClass o => CloneRawClass o
toCloneRaw :: CloneRawClass o => o -> CloneRaw
toCloneRaw = unsafeCastGObject . toGObject


instance (ActorClass a) => ScriptableClass (Clone a)
instance (ActorClass a) => ActorClass (Clone a)
instance (ActorClass a) => GObjectClass (Clone a) where
  toGObject (Clone _ (CloneRaw i)) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Clone (undefined::a) (CloneRaw (castForeignPtr o))

instance GObjectClass CloneRaw where
  toGObject (CloneRaw i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = CloneRaw (castForeignPtr o)


-- *** Behaviour

{# pointer *ClutterBehaviour as Behaviour foreign newtype #}

class GObjectClass o => BehaviourClass o
toBehaviour :: BehaviourClass o => o -> Behaviour
toBehaviour = unsafeCastGObject . toGObject

withBehaviourClass::BehaviourClass o => o -> (Ptr Behaviour -> IO b) -> IO b
withBehaviourClass o = (withBehaviour . toBehaviour) o

newBehaviour a = makeNewGObject (Behaviour, objectUnref) $ return (castPtr a)

instance BehaviourClass Behaviour
instance ScriptableClass Behaviour
instance GObjectClass Behaviour where
  toGObject (Behaviour i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Behaviour (castForeignPtr o)

-- *** BehaviourForeachFunc
type BehaviourForeachFunc = Behaviour -> Actor -> IO ()
type CBehaviourForeachFunc = FunPtr (Ptr Behaviour -> Ptr Actor -> Ptr () -> IO ())
newBehaviourForeachFunc :: BehaviourForeachFunc -> IO CBehaviourForeachFunc
newBehaviourForeachFunc userfunc = mkBehaviourForeachFunc (newBehaviourForeachFunc' userfunc)
    where
      newBehaviourForeachFunc' :: BehaviourForeachFunc -> Ptr Behaviour -> Ptr Actor -> IO ()
      newBehaviourForeachFunc' userfunc bptr aptr = newBehaviour bptr >>= \behave ->
                                                    newActor aptr >>= \actor ->
                                                    userfunc behave actor

foreign import ccall "wrapper"
    mkBehaviourForeachFunc :: (Ptr Behaviour -> Ptr Actor -> IO ()) -> IO CBehaviourForeachFunc

-- *** BehaviourScale

{# pointer *ClutterBehaviourScale as BehaviourScale foreign newtype #}

class GObjectClass o => BehaviourScaleClass o
toBehaviourScale :: BehaviourScaleClass o => o -> Behaviour
toBehaviourScale = unsafeCastGObject . toGObject

newBehaviourScale a = makeNewGObject (BehaviourScale, objectUnref) $ return (castPtr a)

instance BehaviourScaleClass BehaviourScale
instance BehaviourClass BehaviourScale
instance ScriptableClass BehaviourScale
instance GObjectClass BehaviourScale where
  toGObject (BehaviourScale i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BehaviourScale (castForeignPtr o)

-- *** BehaviourDepth

{# pointer *ClutterBehaviourDepth as BehaviourDepth foreign newtype #}

class GObjectClass o => BehaviourDepthClass o
toBehaviourDepth :: BehaviourDepthClass o => o -> BehaviourDepth
toBehaviourDepth = unsafeCastGObject . toGObject

newBehaviourDepth a = makeNewGObject (BehaviourDepth, objectUnref) $ return (castPtr a)

instance BehaviourDepthClass BehaviourDepth
instance BehaviourClass BehaviourDepth
instance ScriptableClass BehaviourDepth
instance GObjectClass BehaviourDepth where
  toGObject (BehaviourDepth i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BehaviourDepth (castForeignPtr o)

-- *** BehaviourEllipse

{# pointer *ClutterBehaviourEllipse as BehaviourEllipse foreign newtype #}

class GObjectClass o => BehaviourEllipseClass o
toBehaviourEllipse :: BehaviourEllipseClass o => o -> BehaviourEllipse
toBehaviourEllipse = unsafeCastGObject . toGObject

newBehaviourEllipse a = makeNewGObject (BehaviourEllipse, objectUnref) $ return (castPtr a)

instance BehaviourEllipseClass BehaviourEllipse
instance BehaviourClass BehaviourEllipse
instance ScriptableClass BehaviourEllipse
instance GObjectClass BehaviourEllipse where
  toGObject (BehaviourEllipse i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BehaviourEllipse (castForeignPtr o)

-- *** BehaviourOpacity

{# pointer *ClutterBehaviourOpacity as BehaviourOpacity foreign newtype #}

class GObjectClass o => BehaviourOpacityClass o
toBehaviourOpacity :: BehaviourOpacityClass o => o -> BehaviourOpacity
toBehaviourOpacity = unsafeCastGObject . toGObject

newBehaviourOpacity a = makeNewGObject (BehaviourOpacity, objectUnref) $ return (castPtr a)

instance BehaviourOpacityClass BehaviourOpacity
instance BehaviourClass BehaviourOpacity
instance ScriptableClass BehaviourOpacity
instance GObjectClass BehaviourOpacity where
  toGObject (BehaviourOpacity i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BehaviourOpacity (castForeignPtr o)

-- *** BehaviourRotate

{# pointer *ClutterBehaviourRotate as BehaviourRotate foreign newtype #}

class GObjectClass o => BehaviourRotateClass o
toBehaviourRotate :: BehaviourRotateClass o => o -> BehaviourRotate
toBehaviourRotate = unsafeCastGObject . toGObject

newBehaviourRotate a = makeNewGObject (BehaviourRotate, objectUnref) $ return (castPtr a)

instance BehaviourRotateClass BehaviourRotate
instance BehaviourClass BehaviourRotate
instance ScriptableClass BehaviourRotate
instance GObjectClass BehaviourRotate where
  toGObject (BehaviourRotate i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BehaviourRotate (castForeignPtr o)


-- *** BehaviourPath

{# pointer *ClutterBehaviourPath as BehaviourPath foreign newtype #}

class GObjectClass o => BehaviourPathClass o
toBehaviourPath :: BehaviourPathClass o => o -> BehaviourPath
toBehaviourPath = unsafeCastGObject . toGObject

newBehaviourPath a = makeNewGObject (BehaviourPath, objectUnref) $ return (castPtr a)

instance BehaviourPathClass BehaviourPath
instance BehaviourClass BehaviourPath
instance ScriptableClass BehaviourPath
instance GObjectClass BehaviourPath where
  toGObject (BehaviourPath i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BehaviourPath (castForeignPtr o)

-- *** Path

{# pointer *ClutterPath as Path foreign newtype #}

class GObjectClass o => PathClass o
toPath :: PathClass o => o -> Path
toPath = unsafeCastGObject . toGObject

--CHECKME: Path has a floating reference, but I don't remember
-- which one you use and I'm really lazy so I'm not going to check now

newPath a = makeNewActor (Path, objectUnref) $ return (castPtr a)

instance PathClass Path
instance GObjectClass Path where
  toGObject (Path i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Path (castForeignPtr o)

-- *** Texture

{# pointer *ClutterTexture as Texture foreign newtype #}

class GObjectClass o => TextureClass o
toTexture :: TextureClass o => o -> Texture
toTexture = unsafeCastGObject . toGObject

newTexture :: Ptr Actor -> IO Texture
newTexture a = makeNewActor (Texture, objectUnref) $ return (castPtr a)

withTextureClass :: TextureClass o => o -> (Ptr Texture -> IO b) -> IO b
withTextureClass o = (withTexture . toTexture) o


instance TextureClass Texture
instance ActorClass Texture
instance ScriptableClass Texture
instance GObjectClass Texture where
  toGObject (Texture i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Texture (castForeignPtr o)

-- *** Shader

{# pointer *ClutterShader as Shader foreign newtype #}

class GObjectClass o => ShaderClass o
toShader :: ShaderClass o => o -> Shader
toShader = unsafeCastGObject . toGObject

newShader a = makeNewGObject (Shader, objectUnref) $ return (castPtr a)

instance ShaderClass Shader
instance GObjectClass Shader where
  toGObject (Shader i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Shader (castForeignPtr o)

-- *** Model

{# pointer *ClutterModel as Model foreign newtype #}

class GObjectClass o => ModelClass o
toModel :: ModelClass o => o -> Model
toModel = unsafeCastGObject . toGObject

withModelClass::ModelClass o => o -> (Ptr Model -> IO b) -> IO b
withModelClass o = (withModel . toModel) o

newModel a = makeNewGObject (Model, objectUnref) $ return (castPtr a)

instance ModelClass Model
instance GObjectClass Model where
  toGObject (Model i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Model (castForeignPtr o)

-- *** ListModel

{# pointer *ClutterListModel as ListModel foreign newtype #}

class GObjectClass o => ListModelClass o
toListModel :: ListModelClass o => o -> ListModel
toListModel = unsafeCastGObject . toGObject

newListModel a = makeNewGObject (ListModel, objectUnref) $ return (castPtr a)

instance ModelClass ListModel
instance ListModelClass ListModel
instance GObjectClass ListModel where
  toGObject (ListModel i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = ListModel (castForeignPtr o)

-- *** ModelIter

{# pointer *ClutterModelIter as ModelIter foreign newtype #}

class GObjectClass o => ModelIterClass o
toModelIter :: ModelIterClass o => o -> ModelIter
toModelIter = unsafeCastGObject . toGObject

newModelIter a = makeNewGObject (ModelIter, objectUnref) $ return (castPtr a)

instance ModelIterClass ModelIter
instance GObjectClass ModelIter where
  toGObject (ModelIter i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = ModelIter (castForeignPtr o)

-- *** Script

{# pointer *ClutterScript as Script foreign newtype #}

class GObjectClass o => ScriptClass o
toScript :: ScriptClass o => o -> Script
toScript = unsafeCastGObject . toGObject

withScriptClass::ScriptClass o => o -> (Ptr Script -> IO b) -> IO b
withScriptClass o = (withScript . toScript) o

newScript a = makeNewActor (Script, objectUnref) $ return (castPtr a)

instance ScriptClass Script
instance ActorClass Script
instance GObjectClass Script where
  toGObject (Script i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Script (castForeignPtr o)

-- *** Knot

type Knot = (Int, Int)

--TypeSynonymInstance
instance Storable Knot where
    sizeOf _ = {# sizeof ClutterKnot #}
    alignment _ = alignment (undefined :: Int)
    peek p = do
      x <- {# get ClutterKnot->x #} p
      y <- {# get ClutterKnot->y #} p
      return (cIntConv x, cIntConv y)

    poke p (x,y) = do
      {# set ClutterKnot->x #} p (cIntConv x)
      {# set ClutterKnot->y #} p (cIntConv y)

-- *** PathNode

{# pointer *ClutterPathNode as PathNodePtr -> PathNode #}

data PathNode = PathNode { pathNodeType :: !PathNodeType,
                           pathNodePoints :: !(Knot, Knot, Knot)
                         } deriving (Eq, Show)

instance Storable PathNode where
  sizeOf _ = {# sizeof ClutterPathNode #}
  alignment _ = alignment (undefined :: Word8)
  peek p = do
      tp <- {# get ClutterPathNode->type #} p
      [p3, p2, p1] <- peekArray 3 (plusPtr p {# sizeof ClutterPathNodeType #})
      --peekArray gets out backwards
      return $ PathNode (cToEnum tp) (p1, p2, p3)

  poke p (PathNode tp (p1, p2, p3)) = do
      {# set ClutterPathNode->type #} p (cFromEnum tp)
      pokeArray (plusPtr p {# sizeof ClutterPathNodeType #}) [p1, p2, p3]

--This seems not right. But it seems to work.
mkPathNode :: PathNode -> IO PathNodePtr
mkPathNode col = do cptr <- (malloc :: IO PathNodePtr)
                    poke cptr col
                    return cptr

withPathNode :: PathNode -> (PathNodePtr -> IO a) -> IO a
withPathNode col = bracket (mkPathNode col) free

newPathNodes :: GSList -> IO [PathNode]
newPathNodes gsl = (fromGSList gsl :: IO [PathNodePtr]) >>= mapM peek

-- *** PathCallback
type PathCallback = PathNode -> IO ()
type CPathCallback = FunPtr (PathNodePtr -> Ptr () -> IO ())
newPathCallback :: PathCallback -> IO CPathCallback
newPathCallback userfunc = mkPathCallback (newPathCallback' userfunc)
    where
      newPathCallback' :: PathCallback -> PathNodePtr -> IO ()
      newPathCallback' userfunc pnPtr = peek pnPtr >>= userfunc

foreign import ccall "wrapper"
    mkPathCallback :: (PathNodePtr -> IO ()) -> IO CPathCallback

-- *** ParamSpecUnits

{# pointer *ClutterParamSpecUnits as ParamSpecUnitsPtr -> ParamSpecUnits #}

--TODO: Prefix the names of the fields of this
data ParamSpecUnits = ParamSpecUnits { defaultType :: !UnitType,
                                       defaultValue :: !Float,
                                       minimum :: !Float,
                                       maximum :: !Float
                                     } deriving (Eq, Show)

--FIXME: Type for alignment
instance Storable ParamSpecUnits where
  sizeOf _ = {# sizeof ClutterParamSpecUnits #}
  alignment _ = alignment (undefined :: Word64)
  peek p = do
      dt <- {# get ClutterParamSpecUnits->default_type #} p
      dval <- {# get ClutterParamSpecUnits->default_value #} p
      min <- {# get ClutterParamSpecUnits->minimum #} p
      max <- {# get ClutterParamSpecUnits->maximum #} p
      return $ ParamSpecUnits (cToEnum dt) (cFloatConv dval) (cFloatConv min) (cFloatConv max)
  poke p (ParamSpecUnits dt dval min max) = do
      {# set ClutterParamSpecUnits->default_type #} p (cFromEnum dt)
      {# set ClutterParamSpecUnits->default_value #} p (cFloatConv dval)
      {# set ClutterParamSpecUnits->minimum #} p (cFloatConv min)
      {# set ClutterParamSpecUnits->maximum #} p (cFloatConv max)

--This seems not right. But it seems to work.
mkParamSpecUnits :: ParamSpecUnits -> IO ParamSpecUnitsPtr
mkParamSpecUnits col = do cptr <- (malloc :: IO ParamSpecUnitsPtr)
                          poke cptr col
                          return cptr

withParamSpecUnits :: ParamSpecUnits -> (ParamSpecUnitsPtr -> IO a) -> IO a
withParamSpecUnits col = bracket (mkParamSpecUnits col) free

newParamSpecUnits :: GSList -> IO [ParamSpecUnits]
newParamSpecUnits gsl = (fromGSList gsl :: IO [ParamSpecUnitsPtr]) >>= mapM peek

-- *** Scriptable

{# pointer *ClutterScriptable as Scriptable foreign newtype #}

class GObjectClass o => ScriptableClass o
toScriptable :: ScriptableClass o => o -> Scriptable
toScriptable = unsafeCastGObject . toGObject

withScriptableClass::ScriptableClass o => o -> (Ptr Scriptable -> IO b) -> IO b
withScriptableClass o = (withScriptable . toScriptable) o

instance ScriptableClass Scriptable
instance GObjectClass Scriptable where
  toGObject (Scriptable i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = Scriptable (castForeignPtr o)

-- *** BindingPool

{# pointer *ClutterBindingPool as BindingPool foreign newtype #}

class GObjectClass o => BindingPoolClass o
toBindingPool :: BindingPoolClass o => o -> BindingPool
toBindingPool = unsafeCastGObject . toGObject

newBindingPool a = makeNewGObject (BindingPool, objectUnref) $ return (castPtr a)

instance BindingPoolClass BindingPool
instance GObjectClass BindingPool where
  toGObject (BindingPool i) = constrGObject (castForeignPtr i)
  unsafeCastGObject (GObject o) = BindingPool (castForeignPtr o)

-- *** GCallback

type GCallback = IO ()
type CGCallback = FunPtr (IO ())

foreign import ccall "wrapper"
    newGCallback :: IO () -> IO CGCallback

-- *** Geometry

data Geometry = Geometry {
      geometryX :: !Int,
      geometryY :: !Int,
      geometryWidth :: !Word,
      geometryHeight :: !Word
    } deriving (Show, Eq)

{# pointer *ClutterGeometry as GeometryPtr -> Geometry #}

instance Storable Geometry where
  sizeOf _ = {# sizeof ClutterGeometry #}
  alignment _ = alignment (undefined :: Int)
  peek p = do
      x <- {# get ClutterGeometry->x #} p
      y <- {# get ClutterGeometry->y #} p
      width <- {# get ClutterGeometry->width #} p
      height <- {# get ClutterGeometry->height #} p
      return $ Geometry (cIntConv x) (cIntConv y) (cIntConv width) (cIntConv height)

  poke p (Geometry x y width height) = do
      {# set ClutterGeometry->x #} p (cIntConv x)
      {# set ClutterGeometry->y #} p (cIntConv y)
      {# set ClutterGeometry->width #} p (cIntConv width)
      {# set ClutterGeometry->height #} p (cIntConv height)


mkGeometry :: Geometry -> IO GeometryPtr
mkGeometry pst = do pptr <- (malloc :: IO GeometryPtr)
                    poke pptr pst
                    return pptr

withGeometry :: Geometry -> (GeometryPtr -> IO a) -> IO a
withGeometry pst = bracket (mkGeometry pst) free

-- *** Vertex

data Vertex = Vertex {
      vertexX :: !Float,
      vertexY :: !Float,
      vertexZ :: !Float
    } deriving (Show, Eq)

{# pointer *ClutterVertex as VertexPtr -> Vertex #}

instance Storable Vertex where
  sizeOf _ = {# sizeof ClutterVertex #}
  alignment _ = alignment (undefined :: Float)
  peek p = do
      x <- {# get ClutterVertex->x #} p
      y <- {# get ClutterVertex->y #} p
      z <- {# get ClutterVertex->z #} p
      return $ Vertex (cFloatConv x) (cFloatConv y) (cFloatConv z)

  poke p (Vertex x y z) = do
      {# set ClutterVertex->x #} p (cFloatConv x)
      {# set ClutterVertex->y #} p (cFloatConv y)
      {# set ClutterVertex->z #} p (cFloatConv z)


mkVertex :: Vertex -> IO VertexPtr
mkVertex pst = do pptr <- (malloc :: IO VertexPtr)
                  poke pptr pst
                  return pptr

withVertex :: Vertex -> (VertexPtr -> IO a) -> IO a
withVertex pst = bracket (mkVertex pst) free


-- *** ActorBox

data ActorBox = ActorBox {
      actorBoxX1 :: !Float,
      actorBoxY1 :: !Float,
      actorBoxX2 :: !Float,
      actorBoxY2 :: !Float
    } deriving (Show, Eq)

{# pointer *ClutterActorBox as ActorBoxPtr -> ActorBox #}

instance Storable ActorBox where
  sizeOf _ = {# sizeof ClutterActorBox #}
  alignment _ = alignment (undefined :: Float)
  peek p = do
      x1 <- {# get ClutterActorBox->x1 #} p
      y1 <- {# get ClutterActorBox->y1 #} p
      x2 <- {# get ClutterActorBox->x2 #} p
      y2 <- {# get ClutterActorBox->y2 #} p
      return $ ActorBox (cFloatConv x1) (cFloatConv y1) (cFloatConv x2) (cFloatConv y2)

  poke p (ActorBox x1 y1 x2 y2) = do
      {# set ClutterActorBox->x1 #} p (cFloatConv x1)
      {# set ClutterActorBox->y1 #} p (cFloatConv y1)
      {# set ClutterActorBox->x2 #} p (cFloatConv x2)
      {# set ClutterActorBox->y2 #} p (cFloatConv y2)


--This seems not right. But it seems to work.
mkActorBox :: ActorBox -> IO ActorBoxPtr
mkActorBox pst = do pptr <- (malloc :: IO ActorBoxPtr)
                    poke pptr pst
                    return pptr

withActorBox :: ActorBox -> (ActorBoxPtr -> IO a) -> IO a
withActorBox pst = bracket (mkActorBox pst) free

-- *** Animatable

{# pointer *ClutterAnimatable as Animatable foreign newtype #}

class GObjectClass o => AnimatableClass o
toAnimatable::AnimatableClass o => o -> Animatable
toAnimatable = unsafeCastGObject . toGObject

withAnimatableClass::AnimatableClass o => o -> (Ptr Animatable -> IO b) -> IO b
withAnimatableClass o = (withAnimatable . toAnimatable) o

--CHECKME: makeNewActor or makeNewGObject? Is is always some kind of
--actor?  does it always have a floating reference or what?
newAnimatable :: (AnimatableClass actor) =>  Ptr actor -> IO Animatable
newAnimatable a = makeNewGObject (Animatable, objectUnref) $ return (castPtr a)

instance AnimatableClass Animatable
instance GObjectClass Animatable where
  toGObject (Animatable a) = constrGObject (castForeignPtr a)
  unsafeCastGObject (GObject o) = Animatable (castForeignPtr o)

-- *** Callback

type Callback = Actor -> IO ()
type CCallback = FunPtr (Ptr Actor -> Ptr () -> IO ())

newCallback :: Callback -> IO CCallback
newCallback userfunc = mkCallback (newCallback' userfunc)
    where
      newCallback' :: (Actor -> IO ()) -> Ptr Actor -> IO ()
      newCallback' userfunc aptr = newActor aptr >>= userfunc

foreign import ccall "wrapper"
    mkCallback :: (Ptr Actor -> IO ()) -> IO CCallback


-- *** ModelForeachFunc

type ModelForeachFunc = Model -> ModelIter -> IO Bool
type CModelForeachFunc = FunPtr (Ptr Model -> Ptr ModelIter -> Ptr () -> IO CInt)

newModelForeachFunc :: ModelForeachFunc -> IO CModelForeachFunc
newModelForeachFunc userfunc = mkModelForeachFunc (newModelForeachFunc' userfunc)
    where
      newModelForeachFunc' :: ModelForeachFunc -> Ptr Model -> Ptr ModelIter -> IO Bool
      newModelForeachFunc' userfunc modPtr miPtr = join $ liftM2 userfunc (newModel modPtr) (newModelIter miPtr)

foreign import ccall "wrapper"
    mkModelForeachFunc :: (Ptr Model -> Ptr ModelIter -> IO Bool) -> IO CModelForeachFunc

-- *** TimeoutPool

{# pointer *ClutterTimeoutPool as TimeoutPool foreign newtype #}


-- *** RGBData

--FIXME/CHECKME: Not really sure best way to deal with this
--This is basically PixbufData without the pixbuf.
-- | An array that stored the raw pixel data in RGB Format.
--
data Ix i => RGBData i e = RGBData {-# UNPACK #-} !(ForeignPtr e)
                                                  !Bool
                                                  !(i,i)
                                   {-# UNPACK #-} !Int

rgbDataHasAlpha :: (Storable e, Ix i) => RGBData i e -> Bool
rgbDataHasAlpha (RGBData _ hasA _ _) = hasA

--FIXME: Bad bad bad
rgbDataData (RGBData ptr _ _ _) = ptr

mkRGBData :: Storable e => ForeignPtr e -> Bool -> Int -> RGBData Int e
mkRGBData (ptr :: ForeignPtr e) hasA size =
  RGBData ptr hasA (0, count) count
  where count = fromIntegral (size `div` sizeOf (undefined :: e))

--CHECKME: Touching things?
-- | 'RGBData' is a mutable array.
instance Storable e => MArray RGBData e IO where
  newArray (l,u) e = error "Clutter.Texture.RGBData.newArray: not implemented"
  newArray_ (l,u)  = error "Clutter.Texture.RGBData.newArray_: not implemented"
  {-# INLINE unsafeRead #-}
  unsafeRead (RGBData pixPtr _ _ _) idx = withForeignPtr pixPtr (flip peekElemOff idx)
  {-# INLINE unsafeWrite #-}
  unsafeWrite (RGBData pixPtr _ _ _) idx elem = withForeignPtr pixPtr (\p -> pokeElemOff p idx elem)
  {-# INLINE getBounds #-}
  getBounds (RGBData _ _ bd _) = return bd
  {-# INLINE getNumElements #-}
  getNumElements (RGBData _ _ _ count) = return count


-- Since some things have the same signal names, classes for them. Not
-- sure if I want to fix things this way Alternatively, rename things
-- to include the name such as timelineActivate and scoreActivate or
-- whatever
--
-- CHECKME: There are multiple
-- actors which have the "activate" signal. They all can't be exported
-- from the one Clutter module. I don't really want to require
-- qualified importing of the different modules and such
-- (e.g. Timeline and Score).
--
-- Also everything deals with the *Class, e.g. StageClass, however you
-- can't instance (StageClass stage) => Activatable stage without
-- undecidable instances which is bad, so I'm just doing instance
-- Activatable Stage. I think this would only be an issue if there was
-- a subclass of Stage (which doesn't exist as far as I know.) If
-- there were one to exist, there would have to be this instance for
-- it (which actually isn't much of a problem, just something to
-- remember if such a class existed). I don't think this is an issue,
-- but I don't know what I'm doing.


--FIXME: This is ugly and confusing, and haddock apparently can't
--document instances. Probably don't do this madness with Activatable
--Documentation for Text's activate

-- | The ::'activate' signal is emitted each time a Text actor is
--    'activated' by the user, normally by pressing the 'Enter'
--    key. The signal is emitted only if "activatable" is set to
--    @True@.
--
-- | The ::'activate' signal is emitted when the stage receives key
--   focus from the underlying window system.
--
-- * Since 0.6
--
class Activatable a where
  onActivate :: a -> IO () -> IO (ConnectId a)
  afterActivate :: a -> IO () -> IO (ConnectId a)
  activate :: Signal a (IO ())


