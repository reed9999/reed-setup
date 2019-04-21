# Install .NET Core
# 

mkdir __dotnet-core
cd __dotnet-core
wget --no-clobber https://dot.net/v1/dotnet-install.sh
chmod +x dotnet-install.sh
if ! ./dotnet-install.sh -c Current ; then
  echo "dotnet install script failed; first try checking permissions."
  exit 1
fi
cd ..
