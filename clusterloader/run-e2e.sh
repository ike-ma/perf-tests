#!/bin/bash

# Copyright 2017 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

CLUSTERLOADER_ROOT=$(dirname "${BASH_SOURCE}")

cd ${CLUSTERLOADER_ROOT}/e2e/ && go test -c -o e2e.test
./e2e.test --host="${KUBE_MASTER_URL}" --ginkgo.v=true --ginkgo.focus="Cluster Loader" --kubeconfig="${HOME}/.kube/config" --viper-config=../config/test

