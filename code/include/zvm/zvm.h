#pragma once

#include "zvm/export.h"
#include "zvm/byte-code.h"

namespace zvm {

class ZVM_EXPORT virtual_machine {
public:
	[[nodiscard]] bool execute(const byte_code &byte_code);

private:
};

}  // namespace zvm
