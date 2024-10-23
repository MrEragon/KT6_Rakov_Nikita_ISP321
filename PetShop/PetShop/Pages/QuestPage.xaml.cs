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

namespace PetShop.Pages
{
    /// <summary>
    /// Логика взаимодействия для QuestPage.xaml
    /// </summary>
    public partial class QuestPage : Page
    {
        public QuestPage()
        {
            InitializeComponent();
            init();
        }

    public void init()
    {
        ListViewBox.ItemsSource = Data.KT6Entities.GetContext().Product.ToList();
        CountItems.Content = $"{Data.KT6Entities.GetContext().Product.Count()}" + $"/{Data.KT6Entities.GetContext().Product.Count()}";
        SearchBox.Text = string.Empty;
        SortUpButton.IsChecked = false;
        SortDownButton.IsChecked = false;

        var ProducerList = Data.KT6Entities.GetContext().Producer.ToList();

        ProducerList.Insert(0, new Data.Producer { Name = "Все производиели" });
        SortComboBox.ItemsSource = ProducerList;
        SortComboBox.SelectedIndex = 0;
    }

    public List<Data.Product> _currentProduct = Data.KT6Entities.GetContext().Product.ToList();

    public void Update()
    {
        try
        {
            var _currentProduct = Data.KT6Entities.GetContext().Product.ToList();
            _currentProduct = (from item in Data.KT6Entities.GetContext().Product
                               where item.Supply.Name.ToLower().Contains(SearchBox.Text) ||
                               item.Description.ToLower().Contains(SearchBox.Text) ||
                               item.Producer.Name.ToLower().Contains(SearchBox.Text) ||
                               item.CountOnStorage.ToString().ToLower().Contains(SearchBox.Text) ||
                               item.Cost.ToString().ToLower().Contains(SearchBox.Text)
                               select item).ToList();
            if (SortUpButton.IsChecked == true)
            {
                _currentProduct.OrderBy(d => d.Cost).ToList();
            }
            if (SortDownButton.IsChecked == true)
            {
                _currentProduct.OrderByDescending(d => d.Cost).ToList();
            }
            var selection = SortComboBox.SelectedItem as Data.Producer;
            if (selection != null && selection.Name != "Все производители")
            {
                _currentProduct.Where(d => d.IDProducer == selection.ID).ToList();
            }
            CountItems.Content = $"{_currentProduct.Count()}" + $"/{Data.KT6Entities.GetContext().Product.Count()}";
            ListViewBox.ItemsSource = _currentProduct;
        }
        catch
        {

        }
    }

        private void SortUpButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void SortDownButton_Checked(object sender, RoutedEventArgs e)
        {
            Update();
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if(Classes.Manager.MainFrame.CanGoBack)
            {
                Classes.Manager.MainFrame.GoBack();
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddOrEditPage());
        }

        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
    }
}
