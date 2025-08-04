def two_sum(nums1, nums2)
  merged_arr = (nums1 + nums2).sort
  
  mid_point = merged_arr.length / 2

  return merged_arr[mid_point].to_f if merged_arr.length.odd?

  return (merged_arr[mid_point] + merged_arr[mid_point - 1]) / 2.to_f
end



nums1 = [-5, 3, 6, 12, 15, -12, -10, -6, -3, 4, 10]
nums2 = [-12, -10, -6, -5, -3, 3, 4, 6, 10, 12, 15]

p two_sum(nums1, nums2)