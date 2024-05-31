using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
using TechnoService2.DBStorage;
using TechnoService2.ViewModel;

namespace TechnoService2.View
{
    /// <summary>
    /// Логика взаимодействия для AddEditRequestWindow.xaml
    /// </summary>
    public partial class AddEditRequestWindow : Window
    {
        private AuthVM _authVM;
        private Request _reqeust;
        private List<Fault> _faults;
        public AddEditRequestWindow(AuthVM authVM, Request request)
        {
            InitializeComponent();

            foreach (var item in App.Current.Windows)
            {
                if (item is AllRequestsWindow)
                {
                    this.Owner = item as Window;
                }
            }

            if (request!=null)
            {
                _reqeust = request;
            }
            else
            {
                _reqeust = new Request();
            }


            _reqeust.DateAdded = DateTime.Now;
            _reqeust.StatusId = 1;
            _reqeust.ApplicantId = authVM.Id;

            this.DataContext = _reqeust;

            LoadFaults();
        }

        private void saveButton_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new TechnoEntities())
            {
                try
                {
                    db.Request.AddOrUpdate(_reqeust);
                    db.SaveChanges();
                    MessageBox.Show("Сохранение прошло успешно","Сохранение",MessageBoxButton.OK,MessageBoxImage.Information);
                    (Owner as AllRequestsWindow)?.RefreshData();
                    Owner.Focus();
                    this.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Произошла ошибка\n{ex}","Ошибка",MessageBoxButton.OK,MessageBoxImage.Error);
                }
            }
        }

        private void LoadFaults()
        {
            using (var db = new TechnoEntities())
            {
                _faults = db.Fault.ToList();
                FaultTypeComboBox.ItemsSource = _faults;
            }
        }
    }
}
