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
    /// Логика взаимодействия для AllRequestsWindow.xaml
    /// </summary>
    public partial class AllRequestsWindow : Window
    {
        private AuthVM _authVM;
        public AllRequestsWindow(AuthVM authVM)
        {
            InitializeComponent();
            _authVM = authVM;

            this.DataContext = new RequestVM();
        }

        private void homeButton_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mw = new MainWindow(_authVM);
            mw.Show();
            this.Close();
        }

        private void addButton_Click(object sender, RoutedEventArgs e)
        {
            AddEditRequestWindow aerw = new AddEditRequestWindow(_authVM, null);
            aerw.ShowDialog();
        }

        private void editButton_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as RequestVM).SelectedRequest != null)
            {
                AddEditRequestWindow aerw = new AddEditRequestWindow(_authVM, (DataContext as RequestVM).SelectedRequest);
                aerw.ShowDialog();
            }
            else
            {
                MessageBox.Show("Выберите элемент для удаления","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
            }
            
        }

        private void deleteButton_Click(object sender, RoutedEventArgs e)
        {
            if ((DataContext as RequestVM).SelectedRequest != null)
            {
                (DataContext as RequestVM).DeleteSelectedData();
            }
            else
            {
                MessageBox.Show("Выберите элемент для удаления","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
            }
        }

        public void RefreshData()
        {
            (DataContext as RequestVM).LoadRequests();
        }
    }
}
