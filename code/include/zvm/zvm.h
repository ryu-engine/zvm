#pragma once

#include "zvm/export.h"
#include "zvm/byte-code.h"

namespace zvm {

class ZVM_EXPORT virtual_machine {
public:
	explicit virtual_machine(std::int32_t argc = 0, const char *argv[] = nullptr) noexcept;

	void assign(byte_code &&code) noexcept;

	[[nodiscard]] bool execute(const byte_code &byte_code);

private:
	byte_code m_code;
};

}  // namespace zvm
