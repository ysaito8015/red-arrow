# Copyright 2017 Kouhei Sutou <kou@clear-code.com>
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

require "arrow/block-openable-applicable"

module Arrow
  module IPC
    class Loader < GObjectIntrospection::Loader
      class << self
        def load
          super("ArrowIPC", IPC)
        end
      end

      include BlockOpenableApplicable

      private
      def post_load(repository, namespace)
        require_libraries
      end

      def require_libraries
        require "arrow/ipc/file-reader"
        require "arrow/ipc/stream-reader"
      end
    end
  end
end
