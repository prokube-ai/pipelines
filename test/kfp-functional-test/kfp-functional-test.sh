#!/bin/sh -ex
# Copyright 2023 The Kubeflow Authors
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
sudo apt-get update -y
sudo apt --no-install-recommends -y -q install curl
source_root="$(pwd)"

python3 -m pip install -r "${source_root}/test/kfp-functional-test/requirements.txt"
HOST="https://$(curl https://raw.githubusercontent.com/kubeflow/testing/master/test-infra/kfp/endpoint)"

python3 "${source_root}/test/kfp-functional-test/run_kfp_functional_test.py" --host "${HOST}"
