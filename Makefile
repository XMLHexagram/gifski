macos:
	@cargo build --release --lib --target aarch64-apple-darwin
	@cargo build --release --lib --target x86_64-apple-darwin
	# @cargo +nightly build -Z build-std --release --lib --target aarch64-apple-ios-macabi
	# @cargo +nightly build -Z build-std --release --lib --target x86_64-apple-ios-macabi
	@$(RM) -rf libs/libgifski.a
	# @$(RM) -rf libs/libmunchausen-maccatalyst.a
	@lipo -create -output libs/libgifski.a \
		target/aarch64-apple-darwin/release/libgifski.a \
		target/x86_64-apple-darwin/release/libgifski.a
	# @lipo -create -output libs/libmunchausen-maccatalyst.a \
	# 	target/aarch64-apple-ios-macabi/release/libmunchausen.a \
	# 	target/x86_64-apple-ios-macabi/release/libmunchausen.a

ios:
	@cargo build --release --lib --target aarch64-apple-ios
	@cargo build --release --lib --target aarch64-apple-ios-sim
	@cargo build --release --lib --target x86_64-apple-ios
	@$(RM) -rf libs/libmunchausen-ios.a
	@$(RM) -rf libs/libmunchausen-ios-sim.a
	@cp target/aarch64-apple-ios/release/libmunchausen.a libs/libmunchausen-ios.a
	@lipo -create -output libs/libmunchausen-ios-sim.a \
		target/aarch64-apple-ios-sim/release/libmunchausen.a \
		target/x86_64-apple-ios/release/libmunchausen.a

		xcodebuild -create-xcframework -library libs/libgifski.a -headers ./module.modulemap ./gifski.h -output gifski.xcframework