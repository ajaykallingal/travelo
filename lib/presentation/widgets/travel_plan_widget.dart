import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class TravelPlanWidget extends StatefulWidget {
  const TravelPlanWidget({super.key});

  @override
  _TravelPlanWidgetState createState() => _TravelPlanWidgetState();
}

class _TravelPlanWidgetState extends State<TravelPlanWidget> {
  DateTime? _departureDate;
  DateTime? _returnDate;
  int _passengerCount = 1;
  String _cabinClass = 'Economy Class';
  bool _isReturnEnabled = false;
  bool _isDateInvalid = false;

  Future<void> _selectDate(BuildContext context, bool isDeparture) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        if (isDeparture) {
          _departureDate = pickedDate;
          _isReturnEnabled = true;
          if (_returnDate != null && _returnDate!.isBefore(_departureDate!)) {
            _returnDate = null;
          }
        } else {
          _returnDate = pickedDate;
        }
        if (_departureDate != null &&
            _returnDate != null &&
            _departureDate!.isAtSameMomentAs(_returnDate!)) {
          _isDateInvalid = true;
        } else {
          _isDateInvalid = false;
        }
      });
    }
  }
  void _selectTravelers(BuildContext context) {
    showModalBottomSheet(

      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('1 Passenger'),
                onTap: () {
                  setState(() => _passengerCount = 1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('2 Passengers'),
                onTap: () {
                  setState(() => _passengerCount = 2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('3 Passengers'),
                onTap: () {
                  setState(() => _passengerCount = 3);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectCabinClass(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Economy Class'),
                onTap: () {
                  setState(() => _cabinClass = 'Economy Class');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Business Class'),
                onTap: () {
                  setState(() => _cabinClass = 'Business Class');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('First Class'),
                onTap: () {
                  setState(() => _cabinClass = 'First Class');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _selectDate(context, true),
                child: _buildCustomInputField(
                  label: 'Departure',
                  value: _departureDate != null
                      ? '${_departureDate!.toLocal()}'.split(' ')[0]
                      : 'Select Date',
                  icon: Icons.calendar_today,
                  isEnabled: true,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: _isReturnEnabled
                    ? () => _selectDate(context, false)
                    : null,
                child: _buildCustomInputField(
                  label: 'Return',
                  value: _returnDate != null
                      ? '${_returnDate!.toLocal()}'.split(' ')[0]
                      : 'Select Date',
                  icon: Icons.calendar_today,
                  isEnabled: _isReturnEnabled,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _selectTravelers(context),
                child: _buildCustomInputField(
                  label: 'Travelers',
                  value: '$_passengerCount Passenger${_passengerCount > 1 ? 's' : ''}',
                  icon: null,
                  isEnabled: true,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: GestureDetector(
                onTap: () => _selectCabinClass(context),
                child: _buildCustomInputField(
                  label: 'Cabin Class',
                  value: _cabinClass,
                  icon: null,
                  isEnabled: true,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomInputField({
    required String label,
    required String value,
    IconData? icon,
    required bool isEnabled,
    bool isInvalid = false, // New parameter for invalid state
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isEnabled ? Colors.white : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (icon != null)
                Icon(
                  icon,
                  size: 20,
                  color: isEnabled ? Colors.black87 : Colors.grey,
                ),
            ],
          ),
        ),
        Positioned(
          left: 16,
          top: -5, // Raised to make it completely visible
          child: Container(
            color: isInvalid ? Colors.grey : AppColors.textFieldTitleBoxColor, // Matches background
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primaryTextColor, // Change color if invalid
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

}


