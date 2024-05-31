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
using System.Windows.Navigation;
using System.Windows.Shapes;
using TechnoService2.View;
using TechnoService2.ViewModel;

namespace TechnoService2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private AuthVM _authVM;
        public MainWindow(AuthVM authVM)
        {
            InitializeComponent();
            _authVM = authVM;
        }

        private void newRequestButton_Click(object sender, RoutedEventArgs e)
        {
            AllRequestsWindow arw = new AllRequestsWindow(_authVM);
            arw.Show();
            this.Close();
        }
    }
}
