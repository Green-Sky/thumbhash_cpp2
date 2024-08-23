#include "./thumbhash.h"

#include "./test_data/testpic_cat1.c.inl"

#include <cassert>
#include <iomanip>

int main(void) {
	assert(testpic_cat1.bytes_per_pixel == 4);

	auto resized = thumbhash::scale_to_size_nn(testpic_cat1.pixel_data, testpic_cat1.width, testpic_cat1.height);

	auto hash_result = thumbhash::rgba_to_hash(resized.out_img, resized.out_w, resized.out_h);

	std::cout << "computed hash:";
	for (const auto e : hash_result) {
		std::cout << " " << std::hex << std::setfill('0') << std::setw(2) << (int)e;
	}
	std::cout << "\n";

	std::cout << "reconstructed aspect ratio: " << thumbhash::hash_to_aspect_ratio(hash_result) << "\n";

	return 0;
}
