#pragma once

#include <vector>
#include <cstddef>

#include <zasm/commands.h>

#include "zvm/config.h"

namespace zvm {

using byte_code = std::vector<zasm::commands::command_type>;

} // namespace zvm
