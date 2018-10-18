#!/bin/sh

# Copyright 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if ! grep -q partition-exists $(which fastboot); then
  echo "fastboot too old; please download the latest version at https://developer.android.com/studio/releases/platform-tools.html"
  exit 1
fi
fastboot flash bootloader bootloader-crosshatch-b1c1-0.1-4948814.img
fastboot reboot-bootloader
sleep 5
fastboot flash radio radio-crosshatch-g845-00023-180815-b-4956438.img
fastboot reboot-bootloader
sleep 5
fastboot -w update image-crosshatch-pd1a.180720.030.zip
