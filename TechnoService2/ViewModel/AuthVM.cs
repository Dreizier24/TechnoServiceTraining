using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechnoService2.DBStorage;
using TechnoService2.View;

namespace TechnoService2.ViewModel
{
    public class AuthVM : BaseViewModel
    {
        private User _user;
        public User User
        {
            get => _user;
            set
            {
                _user = value;
                OnPropertyChanged(nameof(User));
            }
        }

        private ObservableCollection<User> _users;
        public ObservableCollection<User> Users
        {
            get => _users;
            set
            {
                _users = value;
                OnPropertyChanged(nameof(Users));
            }
        }

        private ObservableCollection<User> _selectedUser;
        public ObservableCollection<User> SelectedUsers
        {
            get => _selectedUser;
            set
            {
                _selectedUser = value;
                OnPropertyChanged(nameof(SelectedUsers));
            }
        }

        private string _login;
        public string Login
        {
            get => _login;
            set
            {
                _login = value;
                OnPropertyChanged(nameof(Login));
            }
        }

        private string _password;
        public string Password
        {
            get => _password;
            set
            {
                _password = value;
                OnPropertyChanged(nameof(Password));
            }
        }

        private string _name;
        public string Name
        {
            get => _name;
            set
            {
                _name = value;
                OnPropertyChanged(nameof(Name));
            }
        }

        private string _surname;
        public string Surname
        {
            get => _surname;
            set
            {
                _surname = value;
                OnPropertyChanged(nameof(Surname));
            }
        }

        private string _lastname;
        public string Lastname
        {
            get => _lastname;
            set
            {
                _lastname = value;
                OnPropertyChanged(nameof(Lastname));
            }
        }

        private int _roleId;
        public int RoleId
        {
            get => _roleId;
            set
            {
                _roleId = value;
                OnPropertyChanged(nameof(RoleId));
            }
        }

        private bool _isAutheticated;
        public bool IsAutheticated
        {
            get => _isAutheticated;
            set
            {
                _isAutheticated = value;
                OnPropertyChanged(nameof(IsAutheticated));
            }
        }

        private int _id;
        public int Id
        {
            get => _id;
            set
            {
                _id = value;
                OnPropertyChanged(nameof(Id));
            }
        }

        public AuthVM()
        {

        }

        private bool Authorization(string login, string password)
        {
            using (var db = new TechnoEntities())
            {
                var res = db.User.FirstOrDefault(e=>e.Login == login && e.Password == password);
                if (res!=null)
                {
                    _user = res;
                    _roleId = res.RoleID;
                    _id = res.Id;
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        public void AuthInApp()
        {
            var res = Authorization(Login, Password);
            if (res)
            {
                IsAutheticated = true;
                if (RoleId == 4)
                {
                    AllRequestsWindow arw = new AllRequestsWindow(this);
                    arw.Show();
                }
                else
                {
                    MainWindow mw = new MainWindow(this);
                    mw.Show();
                }
            }
            else
            {
                IsAutheticated = false;
            }
        }
    }
}
