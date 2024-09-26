from prix_goncourt.app.menu import handle_login, display_menu
from prix_goncourt.dao import BookDAO, MembersDAO
from prix_goncourt.models import President, Jury
from prix_goncourt.models.member import Member


def main():
    """
    Main function to run the application.
    """
    members_dao = MembersDAO()
    book_dao = BookDAO()

    while True:
        display_menu()
        option = input("Choose an option: ")

        if option == '1':
            name = input("Enter your name: ")
            password = input("Enter your password: ")

            member_data = members_dao.get_member_by_name(name)
            if member_data:
                if member_data['password'] == password:
                    if member_data['role'] == 'president':
                        member = President(member_data['name'], member_data['password'], member_data['id_member'])
                        handle_login(member, book_dao)
                    elif member_data['role'] == 'jury':
                        member = Jury(member_data['name'], member_data['password'], member_data['id_member'])
                        handle_login(member, book_dao)
                    elif member_data['role'] == 'public':
                        member = Member(member_data['name'], member_data['password'], member_data['id_member'])
                        handle_login(member, book_dao)
                    else:
                        print("Unknown role.")
                else:
                    print("Incorrect password.")
            else:
                print("Incorrect credentials.")
        elif option == '2':
            break
        else:
            print("Invalid option.")