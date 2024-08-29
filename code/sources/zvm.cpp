#include "zvm/zvm.h"

namespace zvm {

bool virtual_machine::execute(const byte_code &byte_code) {
	return std::empty(byte_code);
}

} // namespace zvm
