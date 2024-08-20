import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  double _sliderValue = 7;
  String _selectedGender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(),
          _buildAvailabilitySection(),
          SizedBox(height: 16.h),
          _buildDropdown("City", "All Cities"),
          SizedBox(height: 16.h),
          _buildDropdown("Event Type", "All Events"),
          SizedBox(height: 16.h),
          _buildGenderSection(),
          SizedBox(height: 16.h),
          _buildDropdown("Language", "All Languages"),
          SizedBox(height: 32.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffDF005E),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Apply",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailabilitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Availability",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "1 Hr",
              style: TextStyle(color: Color(0xffDF005E)),
            ),
            Text(
              "10 Hr",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        SliderTheme(
          data: SliderThemeData(
              activeTickMarkColor: Colors.amber,
              valueIndicatorColor: Colors.black,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 24),
              activeTrackColor: const Color(0xffDF005E),
              inactiveTrackColor: Colors.grey[300],
              thumbColor: Colors.white),
          child: Slider(
            value: _sliderValue,
            min: 1,
            max: 10,
            divisions: 9,
            label: "${_sliderValue.toInt()}hr",
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown(String title, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDF005E), width: 1.5),
            ),
          ),
          value: null,
          hint: Text(hint),
          items: <String>['Option 1', 'Option 2', 'Option 3']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildGenderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildGenderOption("Male", Colors.red),
            SizedBox(width: 16.w),
            _buildGenderOption("Female", Colors.grey),
            SizedBox(width: 16.w),
            _buildGenderOption("Rather Not Say", Colors.grey),
          ],
        ),
      ],
    );
  }

  Widget _buildGenderOption(String label, Color color) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: _selectedGender,
          onChanged: (value) {
            setState(() {
              _selectedGender = value!;
            });
          },
          activeColor: const Color(0xffDF005E),
        ),
        Text(
          label,
          style: TextStyle(
            color: _selectedGender == label
                ? const Color(0xffDF005E)
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}
