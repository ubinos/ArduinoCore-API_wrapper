#
# Copyright (c) 2021 Sung Ho Park and CSOS
#
# SPDX-License-Identifier: Apache-2.0
#

if(INCLUDE__ARDUINOCORE_API)

    get_filename_component(_tmp_source_dir "${CMAKE_CURRENT_LIST_DIR}/arduinocore_ubinos" ABSOLUTE)
    get_filename_component(_tmp_api_dir "${ARDUINOCORE_API__BASE_DIR}" ABSOLUTE)

    get_filename_component(_tmp_asensor_dir "${ARDUINOCORE_API__ADAFRUIT_SENSOR_DIR}" ABSOLUTE)
    get_filename_component(_tmp_abme280_dir "${ARDUINOCORE_API__ADAFRUIT_BME280_LIBRARY_DIR}" ABSOLUTE)
    get_filename_component(_tmp_tflite_dir "${ARDUINOCORE_API__TENSORFLOWLITE_DIR}" ABSOLUTE)

    file(GLOB_RECURSE _tmp_sources
        "${_tmp_source_dir}/*.c"
        "${_tmp_source_dir}/*.cpp"
        "${_tmp_source_dir}/*.S"
        "${_tmp_source_dir}/*.s")
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_sources})

    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Common.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Stream.cpp)
    set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_api_dir}/api/Print.cpp)

    if(ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR)
        include_directories(${_tmp_asensor_dir})
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_asensor_dir}/Adafruit_Sensor.cpp)
    endif(ARDUINOCORE_API__INCLUDE_ADAFRUIT_SENSOR)

    if(ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY)
        include_directories(${_tmp_abme280_dir})
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_abme280_dir}/Adafruit_BME280.cpp)
    endif(ARDUINOCORE_API__INCLUDE_ADAFRUIT_BME280_LIBRARY)

    if(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE)
        include_directories(${_tmp_tflite_dir}/src)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/c/common.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/noise_reduction.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/frontend_util.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/frontend.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/filterbank.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/filterbank_util.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/log_scale_util.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/log_lut.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/log_scale.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/noise_reduction_util.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/pcan_gain_control.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/pcan_gain_control_util.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/window.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/window_util.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/fft.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/experimental/microfrontend/lib/fft_util.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/core/api/op_resolver.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/core/api/tensor_utils.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/core/api/error_reporter.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/core/api/flatbuffer_conversions.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/kernels/kernel_util.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/kernels/internal/quantization_util.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/schema/schema_utils.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/all_ops_resolver.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_error_reporter.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_profiler.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_interpreter.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_string.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/memory_helpers.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_allocator.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_time.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/micro_utils.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/recording_micro_allocator.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/recording_simple_memory_allocator.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/simple_memory_allocator.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/test_helpers.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/arduino/debug_log.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/benchmarks/keyword_scrambled_model_data.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/activations.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/arg_min_max.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/circular_buffer.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/concatenation.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/conv_test_common.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/ceil.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/dequantize.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/comparisons.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/detection_postprocess.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/elementwise.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/ethosu.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/flexbuffers_generated_data.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/floor.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/hard_swish.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/kernel_runner.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/kernel_util_full.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/l2norm.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/logical.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/logistic.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/maximum_minimum.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/neg.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/pack.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/pad.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/prelu.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/quantize.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/quantize_common.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/reduce.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/reshape.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/resize_nearest_neighbor.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/round.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/shape.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/split.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/split_v.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/strided_slice.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/sub.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/svdf_common.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/tanh.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/transpose_conv.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/unpack.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/conv.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/svdf.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/add.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/depthwise_conv.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/fully_connected.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/mul.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/pooling.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/kernels/cmsis-nn/softmax.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/memory_planner/linear_memory_planner.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/memory_planner/greedy_memory_planner.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/testing/test_conv_model.cpp)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ActivationFunctions/arm_relu6_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ActivationFunctions/arm_nn_activations_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ActivationFunctions/arm_relu_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ActivationFunctions/arm_nn_activations_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ActivationFunctions/arm_relu_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/BasicMathFunctions/arm_elementwise_mul_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/BasicMathFunctions/arm_elementwise_add_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_y.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_w.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_x.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConcatenationFunctions/arm_concatenation_s8_z.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_1_x_n_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q7_RGB.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_1x1_s8_fast.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q15_basic.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q7_basic.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q15_fast.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q15_fast_nonsquare.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_1x1_HWC_q7_fast_nonsquare.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q7_basic_nonsquare.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q7_fast.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_HWC_q7_fast_nonsquare.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_convolve_wrapper_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_conv_3x3_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_conv_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_conv_s8_opt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_conv_u8_basic_ver1.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_conv_wrapper_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_separable_conv_HWC_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_depthwise_separable_conv_HWC_q7_nonsquare.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_nn_depthwise_conv_s8_core.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_q7_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_q7_q15_reordered.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_s8_s16.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_nn_mat_mult_kernel_s8_s16_reordered.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ConvolutionFunctions/arm_nn_mat_mult_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_mat_q7_vec_q15_opt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q7_opt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/FullyConnectedFunctions/arm_fully_connected_q15_opt.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.c)
        set_source_files_properties(           ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.c PROPERTIES COMPILE_FLAGS -Os)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/PoolingFunctions/arm_avgpool_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/PoolingFunctions/arm_max_pool_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/PoolingFunctions/arm_pool_q7_HWC.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/ReshapeFunctions/arm_reshape_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/SVDFunctions/arm_svdf_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_with_batch_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q7.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_u8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_q15.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/cmsis/CMSIS/NN/Source/SoftmaxFunctions/arm_softmax_s8.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/kissfft/kiss_fft.c)
        set(PROJECT_SOURCES ${PROJECT_SOURCES} ${_tmp_tflite_dir}/src/tensorflow/lite/micro/tools/make/downloads/kissfft/tools/kiss_fftr.c)
    endif(ARDUINOCORE_API__INCLUDE_TENSORFLOWLITE)

endif(INCLUDE__ARDUINOCORE_API)

