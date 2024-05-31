using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using TechnoService2.DBStorage;

namespace TechnoService2.ViewModel
{
    public class RequestVM : BaseViewModel
    {
        private Request _request;
        public Request Request
        {
            get => _request;
            set
            {
                _request = value;
                OnPropertyChanged(nameof(Request));
            }
        }

        private ObservableCollection<Request> _requests;
        public ObservableCollection<Request> Requests
        {
            get => _requests;
            set
            {
                _requests = value;
                OnPropertyChanged(nameof(Requests));
            }
        }

        private Request _selectedRequest;
        public Request SelectedRequest
        {
            get => _selectedRequest;
            set
            {
                _selectedRequest = value;
                OnPropertyChanged(nameof(SelectedRequest));
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

        private DateTime _dateAdded;
        public DateTime DateAdded
        {
            get => _dateAdded;
            set
            {
                _dateAdded = value;
                OnPropertyChanged(nameof(DateAdded));
            }
        }

        private string _equipment;
        public string Equipment
        {
            get => _equipment;
            set
            {
                _equipment = value;
                OnPropertyChanged(nameof(Equipment));
            }
        }

        private int _faultTypeId;
        public int FaultTypeId
        {
            get => _faultTypeId;
            set
            {
                _faultTypeId = value;
                OnPropertyChanged(nameof(FaultTypeId));
            }
        }

        private string _problemDescription;
        public string ProblemDescription
        {
            get => _problemDescription;
            set
            {
                _problemDescription = value;
                OnPropertyChanged(nameof(ProblemDescription));
            }
        }

        private string _clientName;
        public string ClientName
        {
            get => _clientName;
            set
            {
                _clientName = value;
                OnPropertyChanged(nameof(ClientName));
            }
        }

        private int _statusId;
        public int StatusId
        {
            get => _statusId;
            set
            {
                _statusId = value;
                OnPropertyChanged(nameof(StatusId));
            }
        }

        private int _applicantId;
        public int ApplicantId
        {
            get => _applicantId;
            set
            {
                _applicantId = value;
                OnPropertyChanged(nameof(ApplicantId));
            }
        }

        private int _executorId;
        public int ExecutorId
        {
            get => _executorId;
            set
            {
                _executorId = value;
                OnPropertyChanged(nameof(ExecutorId));
            }
        }

        private ObservableCollection<Fault> _faults;
        public ObservableCollection<Fault> Faults
        {
            get => _faults;
            set
            {
                _faults = value;
                OnPropertyChanged(nameof(Faults));
            }
        }

        public void LoadRequests()
        {
            if (Requests.Count > 0)
                Requests.Clear();
            var res = DBStorage.DBStorage.DB_s.Request.ToList();
            res.ForEach(e=>Requests?.Add(e));
        }

        public RequestVM()
        {
            Requests = new ObservableCollection<Request>();
            Faults = new ObservableCollection<Fault>();
            LoadRequests();
        }

        public void DeleteSelectedData()
        {
            using (var db = new TechnoEntities())
            {
                try
                {
                    var res = MessageBox.Show("Вы уверены, что хотите удалить выбранный элемент?\nЭто действие отменить невозможно","Предупреждение",
                        MessageBoxButton.YesNo,MessageBoxImage.Question);

                        if (res == MessageBoxResult.Yes)
                            {
                            var forDelete = db.Request.FirstOrDefault(e => e.Id == SelectedRequest.Id);
                            db.Request.Remove(forDelete);
                            db.SaveChanges();
                            MessageBox.Show("Данные успешно удалены!","Удаление",MessageBoxButton.OK,MessageBoxImage.Information);
                            LoadRequests();
                            }
                } catch (Exception ex)
                {
                    MessageBox.Show($"Во время удаления произошла ошибка\n{ex}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                
            }
        }
    }
}
