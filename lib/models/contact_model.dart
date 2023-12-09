const String tableContact = 'tbl_contact';
const tblContactColId = 'id';
const tblContactColName = 'name';
const tblContactColMobile = 'mobile';
const tblContactColEmail = 'email';
const tblContactColAddress = 'address';
const tblContactColWebsite = 'website';
const tblContactColImage = 'image';
const tblContactColFavorite = 'favorite';
const tblContactColCompany = 'company';
const tblContactColDesignation = 'designation';

class ContactModel{
  int id;
  String name;
  String mobile;
  String email;
  String company;
  String designation;
  String address;
  String website;
  bool favorite;
  String image;

  ContactModel(
      {
        this.id = -1,
        required this.name,
        required this.mobile,
        this.email = '',
        this.company = '',
        this.designation = '',
        this.address = '',
        this.website = '',
        this.favorite = false,
        this.image = 'images/persons.png',
      });
      Map <String, dynamic> toMap(){
        final map = <String, dynamic> {
          tblContactColName: name,
          tblContactColAddress: address,
          tblContactColCompany: company,
          tblContactColDesignation: designation,
          tblContactColEmail: email,
          tblContactColFavorite: favorite ? 1: 0,
          tblContactColImage: image,
          tblContactColMobile: mobile,
          tblContactColWebsite: website,
        };
        if(id > 0){
          map[tblContactColId] = id;
        }
        return map;
      }

      factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
          id: map[tblContactColId],
          name: map[tblContactColName],
          email: map[tblContactColName],
          mobile: map[tblContactColEmail],
          address: map[tblContactColAddress],
          company: map[tblContactColCompany],
          designation: map[tblContactColDesignation],
          website: map[tblContactColWebsite],
          image: map[tblContactColImage],
          favorite: map[tblContactColFavorite] == 1 ? true : false,
       );

      @override
      String toString() {
        return 'ContactModel{id: $id, name: $name, mobile: $mobile, email: $email, company: $company, designation: $designation, address: $address, website: $website, favorite: $favorite, image: $image}';
      }
}