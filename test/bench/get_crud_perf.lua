require('test.bench.setup')
local operations = require('test.bench.operations')

require('fiber').set_slice(30)

local space_name = "customers"
local tuple = {45, 392, "John Fedor",100}
local opts = {
    bucket_id = 392,
}
local primary_key = 45
local N = 10000000

operations.replace_raw(space_name, tuple)
for _ = 1, N do
    operations.get_crud(space_name, primary_key, nil, opts)
end
os.exit(0)
