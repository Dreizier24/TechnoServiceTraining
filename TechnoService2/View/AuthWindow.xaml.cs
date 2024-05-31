using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TechnoService2.ViewModel;

namespace TechnoService2.View
{
    /// <summary>
    /// Логика взаимодействия для AuthWindow.xaml
    /// </summary>
    public partial class AuthWindow : Window
    {
        AuthVM authVM = new AuthVM();
        public AuthWindow()
        {
            InitializeComponent();

            this.DataContext = authVM;
        }

        private void loginBtn_Click(object sender, RoutedEventArgs e)
        {
            authVM.AuthInApp();
            if (authVM.IsAutheticated)
            {
                this.Close();
            }
            else
            {
                MessageBox.Show("Во время авторизации произошла ошибка","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }
    }
}
