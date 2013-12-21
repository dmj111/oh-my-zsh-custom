# If npm is on the path, add its library to the path too.

npm -h > /dev/null 2>&1 && path=(`npm bin -g 2> /dev/null` $path)
