import 'package:app/utils/constants/images_constant.dart';
import 'package:app/view/screens/dashboard/widgets/column_text.dart';
import 'package:app/view/screens/dashboard/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class ProfileViewScreen extends StatefulWidget {
  final user;
  const ProfileViewScreen({super.key, required this.user});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        CustomCard(
          image: Images.people,
          title: "Basic information",
          leftChildren: [
            ColumnText(
              text: 'Name',
              value: "${widget.user.name}",
            ),
            ColumnText(
              text: 'Gender',
              value: "${widget.user.gender}",
            ),
            ColumnText(
              text: 'Age',
              value: "${widget.user.age}",
            ),
            ColumnText(
              text: 'Marital Status',
              value: "${widget.user.maritalstatus}",
            ),
            ColumnText(
              text: 'Complexion',
              value: "${widget.user.complexion}",
            ),
            ColumnText(
              text: 'Physical Status',
              value: "${widget.user.physicalType}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'Date of Birth',
              value: "${widget.user.dOB}",
            ),
            ColumnText(
              text: 'Height',
              value: "${widget.user.height}",
            ),
            ColumnText(
              text: 'Dietary Habits',
              value: "${widget.user.diet}",
            ),
            ColumnText(
              text: 'Drinking Habits',
              value: "${widget.user.drinkh}",
            ),
            ColumnText(
              text: 'Smoking Habits',
              value: "${widget.user.smokha}",
            ),
            ColumnText(
              text: 'Body Type',
              value: "${widget.user.bodyType}",
            ),
          ],
        ),
        CustomCard(
          image: Images.family,
          title: "Family Details",
          leftChildren: [
            ColumnText(
              text: 'Family Type',
              value: "${widget.user.familytype}",
            ),
            ColumnText(
              text: 'Father Occupation',
              value: "${widget.user.fatheroccupation}",
            ),
            ColumnText(
              text: 'Age',
              value: "${widget.user.age}",
            ),
            ColumnText(
              text: 'Mother Occupation ',
              value: "${widget.user.motheroccupation}",
            ),
            ColumnText(
              text: 'No of brothers',
              value: "${widget.user.noofbrother}",
            ),
            ColumnText(
              text: 'How many brothers married',
              value: "${widget.user.married1}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'Family Values',
              value: "${widget.user.famvalue}",
            ),
            ColumnText(
              text: 'Family Income',
              value: "${widget.user.famincome}",
            ),
            ColumnText(
              text: 'Dietary Habits',
              value: "${widget.user.diet}",
            ),
            ColumnText(
              text: 'Family Status',
              value: "${widget.user.famstatus}",
            ),
            ColumnText(
              text: 'No of Sister',
              value: "${widget.user.noofsisters}",
            ),
            ColumnText(
              text: 'How many sister married',
              value: "${widget.user.married}",
            ),
          ],
        ),
        CustomCard(
          image: Images.religion,
          title: "Religion Background",
          leftChildren: [
            ColumnText(
              text: 'Religion',
              value: "${widget.user.religion}",
            ),
            ColumnText(
              text: 'Caste',
              value: "${widget.user.caste}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'Mother Tounge',
              value: "${widget.user.mothertong}",
            ),
            ColumnText(
              text: 'Sub Caste',
              value: "${widget.user.subcast}",
            ),
          ],
        ),
        CustomCard(
          image: Images.education,
          title: "Education & Career",
          leftChildren: [
            ColumnText(
              text: 'Education',
              value: "${widget.user.education}",
            ),
            ColumnText(
              text: 'Employed In',
              value: "${widget.user.employeeIn}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'Occupation',
              value: "${widget.user.occupation}",
            ),
            ColumnText(
              text: 'Annual Income',
              value: "${widget.user.income}",
            ),
          ],
        ),
        CustomCard(
          image: Images.location,
          title: "Location",
          leftChildren: [
            ColumnText(
              text: 'Country',
              value: "${widget.user.country}",
            ),
            ColumnText(
              text: 'State',
              value: "${widget.user.state}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'City',
              value: "${widget.user.city}",
            ),
            ColumnText(
              text: 'Postal Code',
              value: "${widget.user.postalCode}",
            ),
          ],
        ),
        CustomCard(
          image: Images.horoscope,
          title: "Astrology",
          leftChildren: [
            ColumnText(
              text: 'Horoscope',
              value: "${widget.user.horoscope}",
            ),
            ColumnText(
              text: 'Time of Birth',
              value: "${widget.user.timeOfBirth}",
            ),
            ColumnText(
              text: 'Rishi/ Moon Sign',
              value: "${widget.user.rashi}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'Place of Birth',
              value: "${widget.user.birthplace}",
            ),
            ColumnText(
              text: 'Nakshtra',
              value: "${widget.user.nakshtra}",
            ),
            ColumnText(
              text: 'Manglik',
              value: "${widget.user.manglik}",
            ),
          ],
        ),
        CustomCard(
          image: Images.people,
          title: "Contact Information",
          leftChildren: [
            ColumnText(
              text: 'Email id',
              value: "${widget.user.email}",
            ),
          ],
          rightChildren: [
            ColumnText(
              text: 'Mobile No.',
              value: "${widget.user.mobile}",
            ),
          ],
        ),
      ],
    ));
  }
}
