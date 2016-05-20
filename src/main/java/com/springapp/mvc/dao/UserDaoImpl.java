package com.springapp.mvc.dao;

import com.springapp.mvc.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import org.springframework.stereotype.Repository;



@Repository
public class UserDaoImpl implements UserDao {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(user);
        LOGGER.info("User successfully saved. User details: " + user);
    }

    @Override
    public void removeUser(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        if (user != null) {
            session.delete(user);
        }
        LOGGER.info("User successfully removed. User details: " + user);
    }

    @Override
    public void updateUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.update(user);
        LOGGER.info("User successfully update. User details: " + user);
    }

    @Override
    public User getUserById(int id) {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.load(User.class, id);
        LOGGER.info("User successfully loaded. User details: " + user);
        return user;
    }

    @Override
    public List<User> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        List<User> users = session.createQuery("FROM User").list();
        for (User user : users) {
            LOGGER.info("User info: " + user);
        }
        return users;
    }

    @Override
    public List<User> findUsersByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select u from User u where u.name = :name");
        query.setParameter("name", name);
        List<User> users = query.list();
        for (User user : users) {
            LOGGER.info("Finding user info: " + user);
        }
        return users;
    }
}
