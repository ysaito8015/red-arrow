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

require "arrow/record"

module Arrow
  class RecordBatch
    include Enumerable

    def each(reuse_record: false)
      unless block_given?
        return to_enum(__method__, reuse_record: reuse_record)
      end

      if reuse_record
        record = Record.new(self, nil)
        n_rows.times do |i|
          record.index = i
          yield(record)
        end
      else
        n_rows.times do |i|
          yield(Record.new(self, i))
        end
      end
    end

    def find_column(name_or_index)
      case name_or_index
      when String, Symbol
        name = name_or_index
        index = resolve_name(name)
      else
        index = name_or_index
      end
      columns[index]
    end

    alias_method :columns_raw, :columns
    def columns
      @columns ||= columns_raw
    end

    private
    def resolve_name(name)
      (@name_to_index ||= build_name_to_index)[name.to_s]
    end

    def build_name_to_index
      index = {}
      schema.fields.each_with_index do |field, i|
        index[field.name] = i
      end
      index
    end
  end
end
