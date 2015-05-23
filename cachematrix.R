{\rtf1\ansi\ansicpg1252\cocoartf1038\cocoasubrtf360
{\fonttbl\f0\fnil\fcharset0 Consolas;}
{\colortbl;\red255\green255\blue255;\red132\green134\blue132;\red38\green38\blue38;\red95\green79\blue143;
\red136\green35\blue75;\red215\green93\blue59;\red36\green115\blue160;\red12\green46\blue123;}
\paperw11900\paperh16840\margl1440\margr1440\vieww25100\viewh15040\viewkind0
\deftab720
\pard\pardeftab720\sl360\ql\qnatural

\f0\fs24 \cf2 #Matrix inversion is  a costly operation so it is better to achieve caching of the inverse of a matrix rather than compute it repeatedly. \
#The two functions below are used to cache the inverse of a matrix\
\
# makeCacheMatrix creates a list containing a function to\
# 1. set the value of the matrix\cf3 \
\cf2 # 2. get the value of the matrix\cf3 \
\cf2 # 3. set the value of inverse of the matrix\cf3 \
\cf2 # 4. get the value of inverse of the matrix\cf4 \
makeCacheMatrix\cf3  \cf5 <-\cf3  \cf5 function\cf3 (\cf6 x\cf3  \cf5 =\cf3  \cf5 matrix\cf3 ()) \{\
	invs \cf5 <-\cf3  \cf7 NULL\cf3 \
\pard\pardeftab720\sl360\ql\qnatural
\cf4 	set\cf3  \cf5 <-\cf3  \cf5 function\cf3 (y) \{\
	x \cf5 <<-\cf3  y\
	inv \cf5 <<-\cf3  \cf7 NULL\cf0 \
\cf3 \}\
\cf4 get\cf3  \cf5 <-\cf3  \cf5 function\cf3 () x\cf0 \
\cf4 	setinverse\cf3  \cf5 <-\cf3  \cf5 function\cf3 (inverse) invs \cf5 <<-\cf3  inverse\
\cf4 	getinverse\cf3  \cf5 <-\cf3  \cf5 function\cf3 () invs\
\cf5 	list\cf3 (\cf6 set\cf5 =\cf3 set, \cf6 get\cf5 =\cf3 get, \cf6 setinverse\cf5 =\cf3 setinverse, \cf6 getinverse\cf5 =\cf3 getinverse)\
\}\
\pard\pardeftab720\sl360\ql\qnatural
\cf2 # The following function returns the inverse of the matrix. \cf3 \
\cf2 # It first checks if the inverse has been run. \cf3 \
\cf2 # If so, it gets the result and skips the computation. \cf3 \
\cf2 # If not, it runs the inverse, sets the value in the cache via setinverse function.\cf3 \
\
\cf2 # This function assumes that the matrix is always invertible.\cf3 \
\pard\pardeftab720\sl360\ql\qnatural
\cf4 cacheSolve\cf3  \cf5 <-\cf3  \cf5 function\cf3 (x, \cf5 ...\cf3 ) \{\cf0 \
\cf3     invs \cf5 <-\cf3  x\cf5 $\cf3 getinverse()\cf0 \
\cf3     \cf5 if\cf3 (\cf5 !\cf3 is.null(invs)) \{\cf0 \
\cf3         message(\cf8 "getting cached data."\cf3 )\cf0 \
\cf3         \cf5 return\cf3 (invs)\cf0 \
\cf3     \}\cf0 \
\cf3     data \cf5 <-\cf3  x\cf5 $\cf3 get()\cf0 \
\cf3     invs \cf5 <-\cf3  solve(data)\cf0 \
\cf3     x\cf5 $\cf3 setinverse(invs)\cf0 \
\cf3     invs\cf0 \
\cf3 \}\
\
}