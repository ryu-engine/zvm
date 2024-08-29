#include "zvm/zvm.h"

namespace zvm {

virtual_machine::virtual_machine(std::int32_t argc, const char *argv[]) noexcept {
}

void virtual_machine::assign(byte_code &&code) noexcept {
	m_code = std::move(code);
}

bool virtual_machine::execute(const byte_code &byte_code) {
	return std::empty(byte_code);
}

} // namespace zvm
