#!/bin/sh

if [ -e "build.mk.manual" ]; then
  cp build.mk.manual build.mk
  exit
fi

#if [ -e "/usr/local/include/eigen3" ]; then
#  echo "EIGEN_INCLUDE = /usr/local/include/eigen3"
#elif [ -e "/usr/include/eigen3" ]; then
#  echo "EIGEN_INCLUDE = /usr/include/eigen3"
#elif [ -e "${HOME}/opt/include/eigen3" ]; then
#  echo "EIGEN_INCLUDE = ${HOME}/opt/include/eigen3"
#else
#  echo '$(error Could not find /usr/local/include/eigen3 or /usr/include/eigen3)'
#fi

platform=$(uname -s)
if [ ${platform} = "Darwin" ]; then
  echo "GL_LIB_FLAGS = -framework OpenGL -framework GLUT"
  echo "AR = libtool -static -o"
  echo "LD_STATIC_FLAG = "
elif [ ${platform} = "Linux" ]; then
  echo "GL_LIB_FLAGS = -lGL -lGLU -lglut"
  echo "AR = ar -rcs"
  echo "LD_STATIC_FLAG = -static"
else
  echo "$$(error Unknown platform ${platform}.)"
fi


