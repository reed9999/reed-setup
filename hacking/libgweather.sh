cd ~/code/libgweather
sudo apt-get update 
sudo apt install libgeocode-glib-dev
sudo apt install ninja
  meson build && cd build
  ninja
  ninja testh

